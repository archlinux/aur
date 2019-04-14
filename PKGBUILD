# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
# Contributor: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=python-fpyutils
pkgver=1.1.0
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://github.com/frnmst/fpyutils"
license=('GPL3')
depends=('python' 'python-atomicwrites=1.3.0')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}.tar.gz::https://github.com/frnmst/fpyutils/archive/${pkgver}.tar.gz")
sha256sums=('bf215208185d93ebf76171edc9151dea09f60a8174d432b5e5c216f31fafd302')

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}


