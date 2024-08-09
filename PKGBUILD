# Maintainer: piernov <piernov@piernov.org>

pkgname=python-packaging-legacy
pkgver=23.0.post0
pkgrel=1
pkgdesc="Core utilities for legacy Python packages"
arch=('any')
url="https://github.com/di/packaging_legacy"
license=('Apache')
depends=('python-packaging')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/di/packaging_legacy/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('df489be4845dcd915f8e35ea9d609a024f12e8941a4919268fce98913ebf785fc998264f280194755e623d75fbd0799816ca9b4a3759548cf1b67ed9cb885293')

build() {
  cd packaging_legacy-$pkgver
  python -m build -nw
}

check() {
  cd packaging_legacy-$pkgver
  PYTHONPATH=. pytest
}

package() {
  cd packaging_legacy-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
