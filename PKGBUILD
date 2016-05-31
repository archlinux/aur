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
sha512sums=("f3c5dd3ca840a4e44d1976241ce572a0cb565e7ade57899916a8448e35404963a0d2955113551f984012ce7aa890543ca7e60e931d116d6715ed7e7fd2730697"
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
	
