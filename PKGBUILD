# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname="savvycan"
pkgproper="SavvyCAN"
pkgver="199.1"
pkgrel=1
pkgdesc="QT-based CAN bus analysis tool"
url="https://github.com/collin80/SavvyCAN"
license=('MIT')
arch=('x86_64')
depends=('qt5-serialbus')
makedepends=('qt5-base')
source=("https://github.com/collin80/SavvyCAN/archive/V${pkgver}.tar.gz")

build() {
  cd "$srcdir/$pkgproper-$pkgver"
  PREFIX=/usr qmake-qt5
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"
  make
}

check() {
  cd "$srcdir/$pkgproper-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgproper-$pkgver"
	make install
}

sha256sums=('ed1a7131673f7363009ba067252d91053edce7491ff82a0b51d32fe5cee916b6')
