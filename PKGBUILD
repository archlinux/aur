# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=python-pyamdgpuinfo
_name=${pkgname#python-}
pkgver=2.1.6
pkgrel=1
pkgdesc="AMD GPU stats"
arch=('x86_64')
url="https://github.com/mark9064/pyamdgpuinfo"
license=('GPL-3.0-or-later')
depends=('libdrm' 'python')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e42323486d9d22af8537e8e7937f02ca628477f2a373c9a29c6463c1c08bd7ff')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
