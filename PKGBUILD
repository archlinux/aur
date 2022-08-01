# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=python-recordclass
_pkgname=recordclass
pkgver=0.17.2
pkgrel=1
pkgdesc="Mutable variant of namedtuple"
arch=('any')
url="https://pypi.org/project/recordclass"
license=('MIT')
depends=('python' 'cython')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('7a6bd410e29095f7f947a3106e10b6354945029309cc2c9f301f491a797293da')

build(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txts"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
