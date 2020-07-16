# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=mend
pkgver=0.1.1
pkgrel=0
pkgdesc="A notetaking application leveraging a PostgreSQL database"
arch=('any')
url="https://github.com/MarkusG/mend"
license=('GPL3')
validgpgkeys=('6F8F715D6CEAC6CCC49D996BA7E6852582706775')
depends=('postgresql-libs')
makedepends=('meson')
source=("https://github.com/MarkusG/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('51e46fe9af0af8469e9bc3977af2ee890f87cd9ac831a5d89dcc9a1f1185b143bc9ebb68891a746747df38670a818111d299c2e4a1a9cd433c38138949612061')

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
