# Contributor: Vladimir Tsanev <tsachev@gmail.com>
_base=mercurial_extension_utils
pkgname=python2-${_base}
pkgver=1.5.2
pkgrel=1
arch=(any)
pkgdesc="Mercurial Extension Utils"
url="https://pypi.org/project/${_base}"
license=('BSD')
depends=(python2)
makedepends=(python2-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('22f0ec5e922ca88fccaf75648557d8fe13175acd94cc4501f00bd010d8f8f91d8f2808aa1fa45b11ff95c45cf7e26e024d7826aae07f9a45900f6356aa08401e')

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
