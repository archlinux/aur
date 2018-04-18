# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
# Contributor: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=python-fpyutils
pkgver=0.0.4
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://github.com/frnmst/fpyutils"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}.tar.gz::https://github.com/frnmst/fpyutils/archive/${pkgver}.tar.gz")
sha256sums=('75404af8ec8225505eb7cf5bb1307453aba42165aba1d6c7224e9d865046838e')

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}


