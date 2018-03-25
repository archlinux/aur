# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
# Contributor: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=python-fpyutils
pkgver=0.0.3
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://github.com/frnmst/fpyutils"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}.tar.gz::https://github.com/frnmst/fpyutils/archive/${pkgver}.tar.gz")
sha256sums=('faee6481524ff58aef0ae75fac788bb8dc943dcd2fbf8a2d8343e845a84e6dc6')

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}


