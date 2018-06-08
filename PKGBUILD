# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mako
pkgver=1.0
pkgrel=1
license=('MIT')
pkgdesc='Lightweight notification daemon for Wayland'
makedepends=("meson" "scdoc")
depends=(
	"pango"
	"cairo"
	"wayland"
)
arch=("i686" "x86_64")
url='http://mako-project.org'
source=("${pkgname%-*}::git+https://github.com/emersion/mako.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"

	meson --prefix=/usr . build
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}"

	DESTDIR="$pkgdir/" ninja -C build install
}
