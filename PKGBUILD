# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=python-serverfiles
pkgver=0.3.1
pkgrel=1
pkgdesc="A utility that accesses files on a HTTP server and stores them locally for reuse."
arch=('any')
url="https://github.com/biolab/serverfiles"
license=('GPL')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/s/serverfiles/serverfiles-${pkgver}.tar.gz")
sha256sums=('5e10fc32e758791e3735bc08bce2ed4702a83b1e45ab96c5d59cc8aeecfbebe1')

build() {
  cd "${srcdir}/serverfiles-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/serverfiles-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
