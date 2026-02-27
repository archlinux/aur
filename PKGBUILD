# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-mprisify
_name=${pkgname#python-}
pkgver=1.0.1
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
sha256sums=('791d835e497c2749b5bcb4433823921c225b7c92c5c1cd8409651dad3cc18be9')

build() {
  cd "$_name-v$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
