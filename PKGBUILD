# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Stunts <f.pinamartins at gmail dot com>
# Contributor: damir <damir at archlinux dot org>

pkgname=python-biopython
_pkgname=biopython
pkgver=1.74
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
sha512sums=('a5611b993e383d76d2fdc9be22481624180748f06f107e603a062c51b7ca7cf8603d6d97e11d64cd011ae7bd2696c8bf3659b9c625c84c479164a6171d5e8415')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
