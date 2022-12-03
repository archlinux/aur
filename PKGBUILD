# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Stunts <f.pinamartins at gmail dot com>
# Contributor: damir <damir at archlinux dot org>

pkgname=python-biopython
_pkgname=biopython
pkgver=1.80
pkgrel=1
pkgdesc="Freely available Python tools for computational molecular biology"
arch=('x86_64')
url="http://www.biopython.org"
license=('custom')
makedepends=('python-setuptools')
depends=('python-numpy')
optdepends=('python-mysql-connector: for BioSQL module')
source=(http://www.biopython.org/DIST/${_pkgname}-${pkgver}.tar.gz)
changelog=ChangeLog
sha512sums=('f0a87abde6756ddd39469df55a22fff78d5b60e1b9b02ba93661cb05d71e3a2ba20ff5a1695bee0e62b867dd5ac87020117acf302bc0e2215ffe38b657f7632c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
