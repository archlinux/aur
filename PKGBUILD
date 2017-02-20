# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=peek
pkgver=0.9.0
pkgrel=2
pkgdesc="An animated GIF recorder"
arch=('i686' 'x86_64')
url="https://github.com/phw/peek"
license=('GPL3')
depends=(gtk3 ffmpeg imagemagick)
makedepends=(cmake vala gettext)
source=(git+https://github.com/phw/peek.git#tag=v${pkgver})
sha1sums=('SKIP')

build() {
	cd "${srcdir}/peek"
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTS=OFF \
		-DGSETTINGS_COMPILE=OFF .
	make
}

check() {
	cd "${srcdir}/peek"
	#make test
}

package() {
	cd "${srcdir}/peek"
	make DESTDIR=${pkgdir} install
}
