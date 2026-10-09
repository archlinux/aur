# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-letterboxdpy'
_name=${pkgname#python-}
pkgver=6.5.9
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
sha512sums=('068d9d14131c55106f78fd03c250a0328f20f6325b3e49315c7386bce86b156c4cce1f27ca1bb4a889cbc397a82267a48c4eed432b5fdf57929af6b498e86083')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
