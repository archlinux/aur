# Maintainer: Jesse
pkgname=python-openseespy
pkgver=0.2.0
pkgrel=2
pkgdesc='OpenSeesPy: Reliable Build for 3.14 (Fixed Dependencies)'
arch=('x86_64')
url='https://github.com/zhuminjie/OpenSeesPy'
license=('GPL')
depends=('python' 'python-numpy' 'openblas' 'gcc6-libs')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/zhuminjie/OpenSeesPy/archive/refs/tags/0.2.0.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/*/
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/*/
  python -m installer --destdir="$pkgdir" dist/*.whl
  # 这里不再写任何 ln -s，交给系统的 gcc6-libs 处理
}
