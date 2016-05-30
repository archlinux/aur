# Maintainer: Horo <horo@yoitsu.moe>

pkgname=curly-turtle
pkgver=v1.3.0
pkgrel=1
pkgdesc="A web proxy for Google Search"
arch=('any')
url="https://github.com/FiveYellowMice/curly-turtle"
license=('GPL3')
depends=('nodejs')
makedepends=('git' 'npm')
optdepends=(
    'nginx: for reverse proxy'
)
source=("curly-turtle@.service"
        "curly-turtle.install")
sha512sums=("91831102965d805d65de817058a1ff02b5c3f4a720fabab9debdf18b5775cb2841feac30b77819b533571e87eceb05be2d4b836953c5b4e52f8969242704da05"
            "2dfb976a376fa1c66b589df9021f79ef300654de08afcebe62f131e207133cc94d4aa98854878324fc8acfd0f623675a65eb904b89bfff0216ac589117029596")
options=('!strip')
install="curly-turtle.install"
package() {
    local _npmdir="$pkgdir/usr/lib/node_modules/" 
    mkdir -p $_npmdir "$pkgdir/usr/bin"
    cd $_npmdir
    npm install curly-turtle
    ln -s "$pkgdir/usr/lib/node_modules/curly-turtle/bin/curly-turtle" "$pkgdir/usr/bin/curly-turtle"
    chmod 755 "$pkgdir/usr/lib/node_modules/curly-turtle"
}
    

