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
            "a413e336b56ec8b7788a5a3c198c98a215b4b3b552a3d58882fe633b029bc9f4586163bbcb34d019894c7a59fb595bcab8b031f64c2b4189e34ed7c528b16ae7")
options=('!strip')
install="curly-turtle.install"
package() {
    cd $pkgdir
    mkdir -p usr/lib/node_modules/
    npm install  -g --prefix "$pkgdir"/usr curly-turtle
    install -Dm644 "$srcdir"/curly-turtle@.service "$pkgdir"/usr/lib/systemd/system/curly-turtle@.service
    chmod 755 "$pkgdir"/usr/lib/node_modules/curly-turtle
}
	
