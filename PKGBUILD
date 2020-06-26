# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-fpyutils
pkgver=1.2.0
pkgrel=2
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://github.com/frnmst/fpyutils"
license=('GPL3')
depends=('python' 'python-atomicwrites=1.4.0' 'python-yaml=5.3.1' 'python-requests=2.24.0')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://frnmst.gitlab.io/software/fpyutils-${pkgver}.tar.gz.sig" "https://frnmst.gitlab.io/software/fpyutils-${pkgver}.tar.gz")
sha512sums=('SKIP' '7f2fba593c5b05b84f631626b67d71bda85692813f6743d35e33fcb4b8bca0ed7093eacd783d068b4e531a79be6e0da7bd10d617e61fabed89611028711c2436')

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}


