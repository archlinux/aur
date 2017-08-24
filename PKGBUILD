## Maintainer: realasking
pkgname=colunar
pkgver=0.1
pkgrel=1
pkgdesc='A very small Chinese Lunar Calendar can be used in CLI, awesome-widgets or conky, based on Lunar.This is a modified version.'
arch=(x86_64 i686)
url='http://archive.is/A1HYy#selection-281.0-281.123'
license=('GPLv2')
depends=('gcc')
provides=('colunar')
source=(
	'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/colunar/colunar-0.1.tar.bz2'
	'01-Fix-lunar-year-month-display.patch'
)
md5sums=(
	'647d8df9c03aa85089a5437655944185'
	'6bea10afa957fe97d9165390068d5928'
)

prepare() {
	cd "${srcdir}"
	patch -p0 <01-Fix-lunar-year-month-display.patch 
}

build() {
	cd "${srcdir}/colunar-0.1"
	make
}

package() {
	cd "${srcdir}/colunar-0.1"
	install -Dm755 colunar "${pkgdir}/usr/bin/colunar"
}
