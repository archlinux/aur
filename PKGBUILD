# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=python2-acestream
pkgver=0.2.0
pkgrel=1
pkgdesc="Python interface to interact with the AceStream Engine and the HTTP API"
arch=("any")
url="https://github.com/jonian/python-acestream"
license=("GPL")
depends=("python2")
makedepends=("python2-setuptools")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("3fa963ff7a79fb9e8138d397c6aca086")

build() {
  cd "${srcdir}/python-acestream-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/python-acestream-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
