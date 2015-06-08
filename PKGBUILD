# Maintainer: Faerbit <faerbit at gmail dot com>
# Submitter : Jerome Leclanche <jerome@leclan.ch>

pkgname=obconf-qt
pkgver=0.1.0
pkgrel=1
pkgdesc="Openbox configuration tool. Qt port of ObConf"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=("qt5-base")
makedepends=("git" "cmake" "qt5-tools")
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("https://github.com/lxde/obconf-qt/archive/0.1.0.tar.gz")
sha256sums=('90dbc44096fbbacd662f021584f2a18d4ee1f7ee55e04122802a26c36b47301a')

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
