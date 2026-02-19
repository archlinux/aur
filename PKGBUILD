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
source=("https://files.pythonhosted.org/packages/source/o/openseespy/openseespy-0.2.0.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/*/
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/*/
  python -m installer --destdir="$pkgdir" dist/*.whl
}
