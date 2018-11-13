# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=python2-acestream
pkgver=0.1.3
pkgrel=1
pkgdesc="Python interface to interact with the AceStream Engine and the HTTP API"
arch=("any")
url="https://github.com/jonian/python-acestream"
license=("GPL")
depends=("python2")
optdepends=("acestream-engine: AceStream local server")
makedepends=("python2-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("771047c80c03721a45e676bcd38fbb14")

build() {
  cd "${srcdir}/python-acestream-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/python-acestream-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
