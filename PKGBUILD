# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=python-serverfiles
pkgver=0.3.0
pkgrel=2
pkgdesc="A utility that accesses files on a HTTP server and stores them locally for reuse."
arch=('any')
url="https://github.com/biolab/serverfiles"
license=('GPL')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/s/serverfiles/serverfiles-${pkgver}.tar.gz")
sha256sums=('ce38e1dc3518a16b2490f7b84b4ce829f2d6685596c1a3f0fdedbe06d13685ec')

build() {
  cd "${srcdir}/serverfiles-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/serverfiles-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
