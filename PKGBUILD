# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=7-zip
pkgver=22.01
pkgrel=1
pkgdesc="File archiver with a high compression ratio"
url="https://www.7-zip.org"
license=('LGPL' 'BSD' 'custom:unRAR')
arch=(x86_64)
makedepends=(uasm meson)
source=(https://7-zip.org/a/7z2201-src.tar.xz
		meson.build)
sha256sums=('393098730c70042392af808917e765945dc2437dee7aae3cfcc4966eb920fbc5'
            '9ed64c321a4425a8874c56aa0c64132829001be5ad8fdda28426254b723829a1')

build() {
	arch-meson . build

	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
}

