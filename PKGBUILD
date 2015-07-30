# Maintainer: Jeff Sharpe <jeff@impcode.com>
# Contributor: wido <widomaker2k7@gmail.com>:

pkgname=fortune-mod-matrix
pkgver=20091124
pkgrel=3
pkgdesc="Fortune cookies: The trilogy matrix."
arch=('any')
license=('custom')
depends=('fortune-mod')
groups=('fortune-mods')
source="fortunes.txt"
url="http://www.moviemistakes.com/film3297/quotes"
md5sums=('eb8a4013ac36655ec7cd46ca9b6f022c')

build() {
  iconv -f iso-8859-1 -t utf8 "${srcdir}/fortunes.txt" --output "${srcdir}/matrix"
  strfile "${srcdir}/matrix" "${srcdir}/matrix.dat"
}

package() {
	install -D -m644 "${srcdir}/matrix" "${pkgdir}/usr/share/fortune/matrix"
	install -D -m644 "${srcdir}/matrix.dat" "${pkgdir}/usr/share/fortune/matrix.dat"
}
