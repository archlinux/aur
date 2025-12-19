# Maintainer: Charlie Yu (charlieyu4994) <charlieyu4994@outlook.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litesdcard
pkgname=python-$_pkgname
pkgver=2025.08
pkgrel=1
pkgdesc='Small footprint and configurable SD Card core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD-2-Clause')
depends=('python' 'python-pyyaml' 'python-migen' 'python-litex')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('19acfcc57541b27a376a1d8cbfc1cfcdee5ea321be7a6ae288d227f5986bb0b4')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  #pytest test
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set et ts=2 sw=2 syntax=PKGBUILD: