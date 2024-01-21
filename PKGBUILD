# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-aiopath
_name=${pkgname#python-}
pkgver=0.6.11
pkgrel=1
epoch=1
pkgdesc="Asynchronous pathlib for Python"
arch=('any')
url="https://github.com/alexdelorenzo/aiopath"
license=('LGPL-3.0-or-later')
depends=('python-aiofile' 'python-anyio')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b1ab3def2a3c9ce9b0b84efda8caae93c9c0390bcdf77d4b1ae606b075f903d')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
