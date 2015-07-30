# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Jeff Sharpe <jeff@impcode.com>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=fortune-mod-matrix
pkgver=20150730
pkgrel=1
pkgdesc="Fortune cookies: The Matrix trilogy"
arch=('any')
license=('custom')
depends=('fortune-mod')
groups=('fortune-mods')
source="fortunes.txt"
url="https://en.wikiquote.org/wiki/The_Matrix_%28franchise%29"
md5sums=('3ff9ab5a2362b72d3f14768b5a36b06c')

build() {
  if true; then # change true to false to have pure ASCII quotes
    cp "${srcdir}/fortunes.txt" "${srcdir}/matrix"
  else
    sed "s/’/'/g; s/é/e/g; s/è/e/g;" "${srcdir}/fortunes.txt" > "${srcdir}/matrix"
  fi
  strfile "${srcdir}/matrix" "${srcdir}/matrix.dat"
}

package() {
  install -D -m644 "${srcdir}/matrix" "${pkgdir}/usr/share/fortune/matrix"
  install -D -m644 "${srcdir}/matrix.dat" "${pkgdir}/usr/share/fortune/matrix.dat"
}
