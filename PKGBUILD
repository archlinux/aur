# Maintainer: Yiğit Salar <yigit (dot) salar7 (at) gmail (dot) com>
# Maintainer: Bruno Bollos Correa <bollos (at) outlook (dot) com (dot) br>

pkgname=libremines
pkgver=2.2.1
pkgrel=1
pkgdesc="A Free/Libre and Open Source Software Qt based Minesweeper game available for GNU/Linux and FreeBSD"
arch=('x86_64')
url="https://github.com/Bollos00/LibreMines"
license=('GPL3')
groups=()
depends=('hicolor-icon-theme')
makedepends=('cmake' 'qt6-base' 'qt6-svg' 'qt6-multimedia')
provides=('libremines')
conflicts=('libremines')
source=("LibreMines-$pkgver.tar.gz::https://github.com/Bollos00/LibreMines/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de25e9bd34cac80f0827d287504dc90ba7e1dc586a9b3cb5a2b47ffb3150541f')

build() {
	cd $srcdir/LibreMines-$pkgver
	mkdir -p builddir && cd builddir
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd $srcdir/LibreMines-$pkgver/builddir
	make DESTDIR="$pkgdir" install
}
