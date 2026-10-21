# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-letterboxdpy'
_name=${pkgname#python-}
pkgver=6.6.1
pkgrel=1
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
sha512sums=('a60e041fd98b6eb371cd3ca28fdd51202e600892349eebcb03dcb16b3f142d09d2b3a1f37baf9deae5348932d479bf061e57d3ff9e1bafe39b9bbe41826f2a56')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
