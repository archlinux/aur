# Maintainer: Yiğit Salar <yigit.salar7@gmail.com>
# Maintainer: Bruno Bollos Correa <bollos@outlook.com.br>
pkgname=libremines
pkgver=2.1.0
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
sha256sums=('5efd4faaf5db8b85687107576097cc6e80d6c2c136dc388b2793fb738c4a85ba')

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
