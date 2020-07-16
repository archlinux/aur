# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=mend
pkgver=0.1.2
pkgrel=0
pkgdesc="A notetaking application leveraging a PostgreSQL database"
arch=('any')
url="https://github.com/MarkusG/mend"
license=('GPL3')
validgpgkeys=('6F8F715D6CEAC6CCC49D996BA7E6852582706775')
depends=('postgresql-libs')
makedepends=('meson')
source=("https://github.com/MarkusG/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('74210c1e7988458ca91389d3a7499c438ab20e040793dc023dabb73a6a64ca5659e24680cbce4361c59076f5b378dee9a1e610cab9e9cbefaccc89c6afa14197')

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
