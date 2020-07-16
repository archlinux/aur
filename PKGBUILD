# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=hubrelease
pkgver=0.1.4
pkgrel=2
pkgdesc="Create GitHub releases from the command line"
arch=('any')
url="https://github.com/MarkusG/hubrelease"
license=('GPL3')
validgpgkeys=('6F8F715D6CEAC6CCC49D996BA7E6852582706775')
depends=('curl' 'jansson' 'libgit2')
makedepengs=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MarkusG/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('5573af8b98dcc1be61b659d378ab8a72e4dbe64427c5a57ed5387b7523c4cd8dea5eafdfde5f88ba5518cfee8b839d12303f6bb3ba82d25e4635985d0783916f')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
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
