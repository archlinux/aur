# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mako
pkgver=1.0
pkgrel=2
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/emersion/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('524114054b46f2b276577f168a0fe170')

build() {
	cd "${srcdir}/${pkgname}"

	meson --prefix=/usr . build
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}"

	DESTDIR="$pkgdir/" ninja -C build install
}
