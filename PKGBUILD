# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=peek
pkgver=0.5.0
pkgrel=1
pkgdesc="Peek - animated GIF recorder"
arch=('i686' 'x86_64')
url="https://github.com/phw/peek"
license=('GPL3')
depends=(gtk3 ffmpeg imagemagick)
makedepends=(cmake vala gettext)
install=peek.install
source=(git+https://github.com/phw/peek.git#tag=v${pkgver})
sha1sums=('SKIP')

build() {
	cd "${srcdir}/peek"
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
		-DBUILD_TESTS=ON \
		-DGSETTINGS_COMPILE=OFF .
	make
}

check() {
	cd "${srcdir}/peek"
	make test
}

package() {
	cd "${srcdir}/peek"
	make install
}
