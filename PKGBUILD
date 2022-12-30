# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=vanilla-backgrounds
pkgver=1.0.1
pkgrel=1
pkgdesc='Collection of light and dark backgrounds for Vanilla OS'
arch=(any)
url='https://github.com/Vanilla-OS/vanilla-backgrounds'
license=('CCPL:by-sa-4.0' 'CCPL:by-4.0')
depends=(webp-pixbuf-loader)
makedepends=(glib2 meson)
_commit='7246fced5c8762233c27a4978957bed2cdb69bdd'
source=("https://github.com/Vanilla-OS/vanilla-backgrounds/archive/${_commit}.tar.gz")
b2sums=('34d365d26a5d647981af2426beadc95e2bf5f38a162ca90f4e87e5de21ed026463ef872f0682dd4aee9692817282f24bada8f4bda4abcc53675a737e5db30b18')

build() {
	arch-meson ${pkgname}-${_commit} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
