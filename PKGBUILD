# Maintainer: goll <goll@users.noreply.github.com>

pkgname=pipemixer
pkgver=0.4.3
pkgrel=1
pkgdesc='TUI volume control app for pipewire'
arch=('x86_64')
url='https://github.com/heather7283/pipemixer'
license=('GPL-3.0-only')
depends=('glibc' 'libpipewire' 'ncurses')
makedepends=('git' 'meson' 'ninja')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/heather7283/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ebc27ca93225cb50a92367b50ca9f4d12a54014de573713fbe9a3e921aa36764')

build() {
	cd "${pkgname}-${pkgver}"
	arch-meson build
	meson compile -C build
}

package() {
	cd "${pkgname}-${pkgver}"
	meson install -C build --destdir "${pkgdir}"
}
