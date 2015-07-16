# Maintainer: Faerbit <faerbit at gmail dot com>
# Submitter : Jerome Leclanche <jerome@leclan.ch>

pkgname=obconf-qt
pkgver=0.9.0
pkgrel=1
pkgdesc="Openbox configuration tool. Qt port of ObConf"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=("qt4" "openbox")
makedepends=("cmake")
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("https://github.com/lxde/obconf-qt/archive/${pkgver}.tar.gz")
sha256sums=('69d4629cad819c11446ce9971bf9cd262d2066dab16052f16ca5e859525817d5')

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
