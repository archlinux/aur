# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=mend
pkgver=0.1.3
pkgrel=0
pkgdesc="A notetaking application leveraging a PostgreSQL database"
arch=('any')
url="https://github.com/MarkusG/mend"
license=('GPL3')
validgpgkeys=('6F8F715D6CEAC6CCC49D996BA7E6852582706775')
depends=('postgresql-libs')
makedepends=('meson')
source=("https://github.com/MarkusG/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('60e93b7de9b6298f40095c1e015270bec0d47a3e177c8c5e7473058f8164a82b6f86e6f630d28fe5aa6b729df42e2a02c3b81861771154e72978f04d5574dd48')

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	arch-meson build
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install
}
