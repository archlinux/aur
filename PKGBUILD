# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=python-recordclass
_pkgname=recordclass
pkgver=0.21
pkgrel=1
pkgdesc="Mutable variant of namedtuple"
arch=('any')
url="https://pypi.org/project/recordclass"
license=('MIT')
depends=('python' 'cython')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b1ed36ba5099f835114a80ff44ddf84de737df7098a68f7f918e2eb0fabfafe4')

build(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
