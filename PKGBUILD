# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=python-pyamdgpuinfo
_name=${pkgname#python-}
pkgver=2.1.5
pkgrel=1
pkgdesc="AMD GPU stats"
arch=('x86_64')
url="https://github.com/mark9064/pyamdgpuinfo"
license=('GPL3')
depends=('libdrm' 'python')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1001fe2a79d410a577b9dfbb9d9ad1eae627d166e9c8a98039d1e513e1179b7')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
