# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-aiopath
_name=${pkgname#python-}
pkgver=0.7.6
pkgrel=1
epoch=1
pkgdesc="Asynchronous pathlib for Python"
arch=('any')
url="https://github.com/alexdelorenzo/aiopath"
license=('LGPL-3.0-or-later')
depends=('python-aiofile' 'python-anyio')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f7db17c8fd5bff0a6a7d7bdc5e1b69ecb340564af90e4f14a4229c315416cd5')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
