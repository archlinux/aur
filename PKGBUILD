# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=farragone
pkgver=0.1.0
pkgrel=1
pkgdesc="Batch file renamer for programmers"
arch=(any)
url=http://ikn.org.uk/Farragone
license=(GPL3)
makedepends=("python>=3")
depends=("python>=3.1" python-pyqt5 libxkbcommon-x11)
source=(http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e741d2c1a64f9b21aa0234a4f7646d5b')

build () {
    cd "$srcdir/${pkgname}-$pkgver"
    ./configure
    make
}

package () {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
}
