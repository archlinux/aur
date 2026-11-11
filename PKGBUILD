# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-spotapi
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=2
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
sha512sums=('cd115da8b99b1b4b17a7df7fd2d30a061b733170455a6b2d7bb3022ee01ca43bf94f9276ec9230daab27026b9c401f70466e951c188a16a84166dded01bee075')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
