# $id$
# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Stunts <f.pinamartins at gmail dot com>
# Contributor: damir <damir at archlinux dot org>

pkgname=python-biopython
_upstream_pkgname=biopython
pkgver=1.63
pkgrel=2
pkgdesc="Freely available Python tools for computational molecular biology"
arch=('i686' 'x86_64')
url="http://www.biopython.org"
license=('custom')
depends=('python-numpy')
source=(http://www.biopython.org/DIST/${_upstream_pkgname}-${pkgver}.tar.gz)
md5sums=('09c58433150849b131d2d9bbfdf342d3')

build() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}/"
  python setup.py build
}

package() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}/"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
