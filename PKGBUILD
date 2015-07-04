# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=farragone
pkgver=0.2.3
pkgrel=1
pkgdesc="Batch file renamer for programmers"
arch=(any)
url=http://ikn.org.uk/Farragone
license=(GPL3)
makedepends=("python>=3")
depends=("python>=3.1" "python-pyqt5>=5.2" "qt5-base>=5.2" libxkbcommon-x11)
source=(http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('567564dd3fcc6ed348435d708c407ffe')

build () {
    cd "$srcdir/${pkgname}-$pkgver"
    ./configure
    make
}

package () {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
}
