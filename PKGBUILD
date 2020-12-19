# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-fpyutils
pkgver=1.2.2
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://github.com/frnmst/fpyutils"
license=('GPL3')
depends=('python' 'python-atomicwrites=1.4.0' 'python-yaml=5.3.1' 'python-requests=2.25.1')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://frnmst.gitlab.io/software/fpyutils-${pkgver}.tar.gz.sig" "https://frnmst.gitlab.io/software/fpyutils-${pkgver}.tar.gz")
sha512sums=('SKIP' '594734fff54bd5f5e830aefc1aa91af16c1880d7495787faa88f00cc6ef64047a5ac07a8c2030766be7992426329941e123a6a017147f9c4dbf489dcf467c784')

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python -m unittest discover --failfast --locals --verbose
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
