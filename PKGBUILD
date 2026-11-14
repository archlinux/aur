# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-spotapi
_name=${pkgname#python-}
pkgver=2.1.0
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
sha512sums=('6b1e94dab471022788f5492c2732c1e0d749584e45a41ab8db50e5843bc690d7207228f4dee68ca350fad0c02176e119c8d05081d91fc291bd06a158f28a194e')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
