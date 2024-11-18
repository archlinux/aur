# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="python-accesskit"
pkgver=0.6.0
pkgrel=1
pkgdesc="AccessKit bindings for Python."
arch=('any')
url='https://accesskit.dev/'
license=('Apache-2.0' 'MIT')
depends=(
    'python')
makedepends=(
  'rust'
  'python-maturin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AccessKit/accesskit-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f76cf837396079081511ee61e6c637ed12bee3b72ff395ddc0e2b7a46fc9d4d1')

build() {
  cd accesskit-python-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd accesskit-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
