# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=hubrelease
pkgver=0.1.0
pkgrel=0
pkgdesc="Automatically create GitHub releases"
arch=('any')
url="https://github.com/MarkusGordathian/hubrelease"
license=('GPL3')
validgpgkeys=('6F8F715D6CEAC6CCC49D996BA7E6852582706775')
depends=('curl' 'jansson' 'libgit2')
source=("hubrelease-${pkgver}.tar.gz::https://github.com/MarkusGordathian/hubrelease/releases/download/${pkgver}/${pkgver}.tar.gz")
sha512sums=('9d729689fd01936639a5b0338834bbfeeb1cb4abfb564cf7d2efb7daf0fd9fb62b59bf172248cf74848d0373a9732cae936dd8b040f7ffc275adea809888000c')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
	install -D -m755 hubrelease "${pkgdir}/usr/bin/hubrelease"
	# install -D -m644 hubrelease.1.gz "${pkgdir}/usr/share/man/man1/hubrelease.1.gz"
}
