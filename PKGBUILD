# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-fpyutils
pkgver=2.1.0
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://blog.franco.net.eu.org/software/#fpyutils"
license=('GPL3')
depends=('python' 'python-atomicwrites=1.4.0' 'python-requests=2.26.0')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/fpyutils-${pkgver}/fpyutils-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/fpyutils-${pkgver}/fpyutils-${pkgver}.tar.gz")
sha512sums=('SKIP' '9c5efeb40bb76e3ed4515d45a73aae5bba25a8032b546b88e4ad1197f1761b72c1b4b64b89973b25a42bd34e819b240d0db99eb1b022ee48078cfeca16736a66')

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python -m unittest discover --failfast --locals --verbose
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
