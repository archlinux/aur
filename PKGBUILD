# Maintainer: goll <goll@users.noreply.github.com>

pkgname=pipemixer
pkgver=0.5.1
pkgrel=1
pkgdesc='TUI volume control app for pipewire'
arch=('x86_64')
url='https://github.com/heather7283/pipemixer'
license=('GPL-3.0-only')
depends=('glibc' 'libpipewire' 'ncurses')
makedepends=('git' 'meson' 'ninja')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/heather7283/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e61f6c9b113e63af79e84e4f963c2aebdac383281d26b7d02e1fca06158592b1')

build() {
	cd "${pkgname}-${pkgver}"
	arch-meson build
	meson compile -C build
}

package() {
	cd "${pkgname}-${pkgver}"
	meson install -C build --destdir "${pkgdir}"
}
