# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_name=bandcamp_api
pkgname=python-bandcamp-api
pkgver=0.1.15
pkgrel=1
pkgdesc="A simple way to get info from Bandcamp"
arch=(any)
url="https://github.com/RustyRin/bandcamp-api"
license=(GPL3)
depends=(
  python-beautifulsoup4
  python-demjson3
  python-html5lib
  python-lxml
  python-requests
  python-setuptools
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e299d4880b0e2d7d410508ce8549234b21e71b2437af1dc900515880430ba46e')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
