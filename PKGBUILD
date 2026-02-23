# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="python-accesskit"
pkgver=0.7.0
pkgrel=1
pkgdesc="AccessKit bindings for Python."
arch=('any')
url='https://accesskit.dev/'
license=('Apache-2.0' 'MIT')
depends=(
    'python')
makedepends=(
  'python-build'
  'python-installer'
  'python-maturin'
  'python-wheel'
  'rust'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AccessKit/accesskit-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e63ad215af14b1db445ca2a73029d1bb711172f707253587c35753b89d53e950')

build() {
  cd accesskit-python-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd accesskit-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
