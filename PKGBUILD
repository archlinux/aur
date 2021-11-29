# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=detwinner
pkgver=0.4.1
pkgrel=1
pkgdesc='Duplicate file finder for the Linux desktop'
url='https://neatdecisions.com/products/detwinner-linux/'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('gtkmm3>=3.22' 'graphicsmagick')
makedepends=('meson' 'gtest' 'cppcheck')
checkdepends=('appstream-glib')
source=("https://github.com/neatdecisions/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08e348dff6ac40cec5f6bf3bd1ab4d7fbcde0932550a682d3171b5c1c34f7ffe')

build() {
	arch-meson ${pkgname}-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
