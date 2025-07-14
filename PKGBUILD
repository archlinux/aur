# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=python-fuzzysearch
pkgver=0.8.0
pkgrel=1
pkgdesc="A Python library for fuzzy substring searches"
arch=("any")
url="https://github.com/taleinat/fuzzysearch"
license=("MIT")
depends=("python" "python-attrs")
makedepends=("python-setuptools")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('91c9e99c427b12eb7469fe2102437221')

build() {
  cd "${srcdir}/fuzzysearch-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/fuzzysearch-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
