# Maintainer: Bruno Bollos Correa <bollos@outlook.com.br>
pkgname=libremines

pkgver=2.0.0
pkgrel=1
pkgdesc="A Free/Libre and Open Source Software Qt based Minesweeper game available for GNU/Linux and FreeBSD"
arch=('x86_64')
url="https://github.com/Bollos00/LibreMines"
license=('GPL3')
groups=()
depends=('qt6-base' 'hicolor-icon-theme' 'qt6-svg' 'qt6-multimedia')
makedepends=('cmake')
provides=('libremines')
conflicts=('libremines')
source=("LibreMines-$pkgver.tar.gz::https://github.com/Bollos00/LibreMines/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0902a6c8469760a9a7a40bd4cddcfa3b52ba32a1388a95229f2e9792f94e9a94')


build() {
	cd $srcdir/LibreMines-$pkgver
	mkdir builddir && cd builddir
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd $srcdir/LibreMines-$pkgver/builddir
	make DESTDIR="$pkgdir" install
}
