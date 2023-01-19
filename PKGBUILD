# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=farragone
pkgver=0.2.5
pkgrel=1
pkgdesc="Batch file renamer for programmers"
arch=(any)
url=http://ikn.org.uk/app/farragone
license=(GPL3)
makedepends=(python-setuptools)
depends=("python>=3.1" "python-pyqt5>=5.2" "qt5-base>=5.2" libxkbcommon-x11)
source=(http://ikn.org.uk/download/app/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('44da497e7ec5f0aaf470fdff05ed9b2e1b4dca1247a308f00bb8224f158c93b1')

build () {
    cd "$srcdir/${pkgname}-$pkgver"
    make
}

package () {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
}
