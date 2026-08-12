# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-letterboxdpy'
_name=${pkgname#python-}
pkgver=6.5.7
pkgrel=2
pkgdesc="A Python library for Letterboxd data."
arch=('any')
url="https://github.com/nmcassa/letterboxdpy"
license=('MIT')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-lxml'
  'python-curl_cffi'
  'python-fastfingertips'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('7d17c18e9ec23e9981138b6d0486243475cec3bfa3b6b03b7bbeea4ed173ccf077d65bd1ebabbed6fea724d0d9028067477ecce0b2cf328d129ea8914fdc11ae')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
