# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-intervaltree
_pkgname=intervaltree
pkgver=3.0.2
pkgrel=1
pkgdesc='Library providing a mutable, self-balancing interval tree for Python.'
arch=(any)
url=https://github.com/chaimleib/intervaltree
license=('Apache')
depends=(python-sortedcontainers)
makedepends=(python-setuptools)
source=(https://github.com/chaimleib/${_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('e8ab75b66077f2e5fb85ac56cb6df834689edb048d38601d53d8867cce3b77d1')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
