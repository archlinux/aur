# Maintainer: Ferdinand Bachmann <me+aur@yrlf.at>

_pkgname=slurp_sway
pkgname=python-${_pkgname/_/-}
pkgver=1.0.1
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
sha256sums=('1463945ebdbff3e80084947cd8c8df0af331e09c68fbf51bea221097d21c60bc')

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
