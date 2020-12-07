# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-fpyutils
pkgver=1.2.1
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://github.com/frnmst/fpyutils"
license=('GPL3')
depends=('python' 'python-atomicwrites=1.4.0' 'python-yaml=5.3.1' 'python-requests=2.25.0')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://frnmst.gitlab.io/software/fpyutils-${pkgver}.tar.gz.sig" "https://frnmst.gitlab.io/software/fpyutils-${pkgver}.tar.gz")
sha512sums=('SKIP' 'a77ca6740a4a9b6cf4ad9e0b3effe7be316ae361ccc635548267ae5cbcd40679a8efdac6ab193efc928f5c104ea698159128ec6b4e44fea587f4cb1af92adba1')

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
