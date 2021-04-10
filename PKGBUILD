# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-fpyutils
pkgver=1.2.3
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://github.com/frnmst/fpyutils"
license=('GPL3')
depends=('python' 'python-atomicwrites=1.4.0' 'python-yaml=5.4.1.1' 'python-requests=2.25.1')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/fpyutils-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/fpyutils-${pkgver}.tar.gz")
sha512sums=('SKIP' "ded4081bc172ee5a8038f5d2ec0b24b044af8742b39e8afcabd5989e3a8d436714b87395865c2772f9b7c7466809bfb3f278a9d420c6f16e604c4bcd379fe02b")

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python -m unittest discover --failfast --locals --verbose
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
