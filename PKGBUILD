# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-fastfingertips'
_name=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="A Python library for Letterboxd data."
arch=('any')
url="https://github.com/fastfingertips/fastfingertips-pypi"
license=('MIT')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-requests'
  'python-termcolor'
)
makedepends=(
  'python-build'
  'python-installer'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('0b0a0bbb8d17743b7e323d506544a656c1300ead2dedf6dd52d6cf3d1e387bdaa4ec92db245458446803012b5f2cc3a83a9c4da9cb06f498b7c648883a944e8d')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
