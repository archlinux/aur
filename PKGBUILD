# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mako
pkgver=1.1
pkgrel=4
license=('MIT')
pkgdesc='Lightweight notification daemon for Wayland'
makedepends=("meson" "scdoc")
depends=(
	"pango"
	"cairo"
	"wayland"
	"wayland-protocols"
)
arch=("i686" "x86_64")
url='http://mako-project.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/emersion/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('0ee1d576a0445112aa50fb4873e1d7b1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	meson --prefix=/usr . build
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" ninja -C build install
}
