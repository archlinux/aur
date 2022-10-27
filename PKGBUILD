# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-fpyutils
pkgver=2.2.1
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://blog.franco.net.eu.org/software/#fpyutils"
license=('GPL3')
depends=('python' 'python-atomicwrites=1.4.1' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/fpyutils-${pkgver}/fpyutils-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/fpyutils-${pkgver}/fpyutils-${pkgver}.tar.gz")
sha512sums=('SKIP' '4771fe2f0a8654f9ae1210e9315be263d63427b09c8ac4340b17cb9435854b82ce09071492ce028a8dbf4f37412d37013f6378255679731f8ad2f23c4ea6168b')

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python -m unittest discover --failfast --locals --verbose
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
