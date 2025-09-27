# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-mprisify
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Python MPRIS server library for Linux media player apps"
arch=('any')
url="https://gitlab.com/zehkira/mprisify"
license=('LGPL-3.0-only')
depends=(
  'python-gobject'
  'python-pydbus'
  'python-strenum'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$url/-/archive/v$pkgver/$_name-v$pkgver.tar.gz")
sha256sums=('a3abe8486c22c0e39002f2d46a86812176f8c503bba580580fc1bed24fa56169')

build() {
  cd "$_name-v$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
