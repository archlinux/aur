# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-spotapi
_name=${pkgname#python-}
pkgver=2.1.3
pkgrel=1
pkgdesc="A sleek API wrapper for Spotify's private API"
arch=('any')
url="https://pypi.org/project/spotapi/"
license=('GPL-3.0-only')
depends=(
  'python'
  'python-wreq'
)
makedepends=('python-build' 'python-hatchling' 'python-installer')
optdepends=(
  'python-dotenv: studio extra'
  'python-httpx: demo extra'
  'python-pillow: demo extra'
  'python-pywebview: studio extra'
  'python-textual: demo extra'
  'python-textual-image: demo extra'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('8b43a8e01aa0fde172f516018710e0499fe9a33c680a6dca8f7c858fb03d4de10bb1d58ae4f839f5da59ba26e6500c447b8061f135deae0e68f32a120ac17a8a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
