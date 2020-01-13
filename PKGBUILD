# Maintainer: Tom Zander

pkgname=fulcrum
pkgver=1.0
pkgrel=1
pkgdesc="Fulcrum"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base')
install=fulcrum.install
backup=("etc/fulcrum.conf")
source=("git+https://github.com/cculianu/Fulcrum.git"
    "fulcrum.conf"
    )
sha256sums=('SKIP'
    '9e8feec3c2c4f87377a6e24112b5025108aadc6352e78488a4f4ab851a5da337'
)

build() {
    cd "$srcdir/Fulcrum/"
    qmake .
    make
}

package() {
    install -Dm 775 "$srcdir/Fulcrum/Fulcrum" -T "$pkgdir/usr/bin/fulcrum"
    install -Dm 664 "$srcdir/fulcrum.conf" -t "$pkgdir/etc/"
}
