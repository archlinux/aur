# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_name=bandcamp_api
pkgname=python-bandcamp-api
pkgver=0.2.3
pkgrel=2
pkgdesc="A simple way to get info from Bandcamp"
arch=(any)
url="https://github.com/RustyRin/bandcamp-api"
license=('GPL-3.0-only')
depends=(
  python-beautifulsoup4
  python-demjson3
  python-html5lib
  python-lxml
  python-requests
  python-setuptools
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('eff597328edf083307013a7884407c6fb7cd2568ac52fd3a85b3fe3bcefc3e1b')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
