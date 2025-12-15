# Maintainer: Ferdinand Bachmann <me+aur@yrlf.at>

_pkgname=slurp_sway
pkgname=python-${_pkgname/_/-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Slurp with Sway-specific features such as toplevel selection"
arch=('any')
url="https://github.com/Ferdi265/slurp_sway/"
license=('MIT')
depends=('python' 'slurp' 'sway')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Ferdi265/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b21d86d086f239ba30f6c2dd22a36f3c28c834c01d23cfff9e0af247929d0146')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
