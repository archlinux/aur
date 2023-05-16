# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=python-pyamdgpuinfo
_name=${pkgname#python-}
pkgver=2.1.4
pkgrel=1
pkgdesc="AMD GPU stats"
arch=('x86_64')
url="https://github.com/mark9064/pyamdgpuinfo"
license=('GPL3')
depends=('libdrm' 'python')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4895e07a45e09d1ac6b18bc2dc6c7ee492c76d251c5b39b18f277e8aa2b5dbae')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
