# Maintainer: Faerbit <faerbit at gmail dot com>
# Submitter : Jerome Leclanche <jerome@leclan.ch>

pkgname=obconf-qt
pkgver=0.11.0
pkgrel=1
pkgdesc="Openbox configuration tool. Qt port of ObConf"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=("qt5-base" "openbox" "qt5-x11extras")
makedepends=("cmake" "qt5-tools" "liblxqt" "git")
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("https://github.com/lxde/obconf-qt/archive/${pkgver}.tar.gz")
sha256sums=('5cff74c0a4859b426302092de48c2c9e982cea6f3e00cdb2fa7a37ee6a306fea')

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
