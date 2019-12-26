# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=hubrelease
pkgver=0.1.1
pkgrel=0
pkgdesc="Automatically create GitHub releases"
arch=('any')
url="https://github.com/MarkusGordathian/hubrelease"
license=('GPL3')
validgpgkeys=('6F8F715D6CEAC6CCC49D996BA7E6852582706775')
depends=('curl' 'jansson' 'libgit2')
source=("hubrelease-${pkgver}.tar.gz::https://github.com/MarkusGordathian/hubrelease/releases/download/${pkgver}/${pkgver}.tar.gz")
sha512sums=('c38d1784a82cda20360dc5a984246e82f05bb84c5d014522c18458310d21d956b12c15f2cb4bd489a0f6ecc6dd7c6e66438a4e3c25826e2bccfdfe0b13f8f311')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
	install -D -m755 hubrelease "${pkgdir}/usr/bin/hubrelease"
	# install -D -m644 hubrelease.1.gz "${pkgdir}/usr/share/man/man1/hubrelease.1.gz"
}
