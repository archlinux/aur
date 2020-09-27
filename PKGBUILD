# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=python-fuzzysearch
pkgver=0.7.3
pkgrel=2
pkgdesc="A Python library for fuzzy substring searches"
arch=("any")
url="https://github.com/taleinat/fuzzysearch"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("1466c8a2c3366120568fb3f66f9d0306")

build() {
  cd "${srcdir}/fuzzysearch-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/fuzzysearch-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
