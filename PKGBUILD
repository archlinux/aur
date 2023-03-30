# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=vanilla-backgrounds
pkgver=1.0.3
pkgrel=1
pkgdesc='Collection of light and dark backgrounds for Vanilla OS'
arch=(any)
url='https://github.com/Vanilla-OS/vanilla-backgrounds'
license=('CCPL:by-sa-4.0' 'CCPL:by-4.0')
depends=(webp-pixbuf-loader)
makedepends=(glib2 meson)
_commit='3f63407a5714ad4452db228a79d4974658c86724'
source=("https://github.com/Vanilla-OS/vanilla-backgrounds/archive/${_commit}.tar.gz")
b2sums=('b40a3509e6ed887a071b71cc6b1f07e84f6007de6510e13a7ee4b425546b11bd9021d1c93bc51a2ef4b2b669e115d777c73904411853d03f76ab5fe4a9249dd8')

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
