# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=python-fuzzysearch
pkgver=0.6.2
pkgrel=1
pkgdesc="A Python library for fuzzy substring searches"
arch=("any")
url="https://github.com/taleinat/fuzzysearch"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("3a39cfa979faafbde6259980d96af9f9")

build() {
  cd "${srcdir}/fuzzysearch-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/fuzzysearch-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
