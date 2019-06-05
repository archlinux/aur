# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: <kontakt.zuf(at)gmail.com>

pkgname=panini
pkgver=0.73.0
pkgrel=1
pkgdesc='visual tool for creating perspective views from panoramic and wide angle photographs'
url='https://github.com/lazarus-pkgs/panini'
arch=('i686' 'x86_64')
depends=('qt5-base' 'zlib' 'glu')
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lazarus-pkgs/panini/archive/v${pkgver}.tar.gz")
sha256sums=('9cdb6a40e9ea53a5b35ab3a73cf66879fe253d94908d108203b82847a08e33ed')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	qmake-qt5
	make release
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m 0755 panini "${pkgdir}/usr/bin/${pkgname}"
}
