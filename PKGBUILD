# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-fpyutils
pkgver=1.1.2
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://github.com/frnmst/fpyutils"
license=('GPL3')
depends=('python' 'python-atomicwrites=1.4.0')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}.tar.gz::https://github.com/frnmst/fpyutils/archive/${pkgver}.tar.gz")
sha256sums=('7f2db6439abcf9994be19b73c146739f7189f9864a828f9f05141cd349f7bf37')

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}


