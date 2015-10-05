# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=acquisition-plus
pkgver=0.3c
pkgrel=1
pkgdesc="Inventory management tool for Path of Exile"
url="https://github.com/Novynn/acquisitionplus"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt5-base' 'libxkbcommon-x11')

source=("https://github.com/Novynn/acquisitionplus/archive/${pkgver}-PLUS.tar.gz")
sha256sums=('6e29752d93cdb9253b1a380bdaa8331b324f8f72babb29c1f12a32bcd1464aeb')

build() {
    cd "$srcdir/acquisitionplus-${pkgver}-PLUS"

    qmake QMAKE_CC="$CC" QMAKE_CXX="$CXX"
    make
}

package() {
    cd "$srcdir/acquisitionplus-${pkgver}-PLUS"
    install -Dm755 acquisitionplus "$pkgdir"/usr/bin/acquisitionplus
}
