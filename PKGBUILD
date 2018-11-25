# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mako
pkgver=1.2
pkgrel=1
license=('MIT')
pkgdesc='Lightweight notification daemon for Wayland'
makedepends=("meson" "scdoc" "wayland-protocols")
depends=(
	"pango"
	"cairo"
	"wayland"
)
arch=("i686" "x86_64")
url='http://mako-project.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/emersion/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('c4d0b66f92a28368a43d31b684acc6f9')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	meson --prefix=/usr . build
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C build install
}
