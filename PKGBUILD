# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
pkgname=python-colorthief
_name=color-thief-py
pkgver=0.2.1
pkgrel=4
pkgdesc="Python module for grabbing the color palette from an image"
arch=('any')
url="https://lokeshdhakar.com/projects/color-thief"
license=('BSD-3-Clause')
depends=(
  'python'
  'python-pillow'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::https://github.com/fengsp/color-thief-py/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f2c47cad43809048adb9be1e4e63519d32e3b68532e8f0ab7bf46a58ddf7d099')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
