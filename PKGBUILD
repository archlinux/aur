# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_name=bandcamp_api
pkgname=python-bandcamp-api
pkgver=0.2.2
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
sha256sums=('bff880095701142ff7c78bfb43fd69f9a1c685fc37010e37794dec2b3e41b242')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
