# Maintainer: Jesse
pkgname=python-openseespy
pkgver=0.2.0
pkgrel=2
pkgdesc='OpenSeesPy: Reliable Build for 3.14 (Fixed Dependencies)'
arch=('x86_64')
url='https://pypi.org/project/openseespy/'
license=('GPL')
depends=('python' 'python-numpy' 'openblas' 'gcc6-libs')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/o/openseespy/openseespy-0.2.0.tar.gz")
sha256sums=('ad62182d960a7517c3cb7fcc70acb00903642c80b9f089a60a071bfcfd75a559')

build() {
  cd "$srcdir"/*/
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/*/
  python -m installer --destdir="$pkgdir" dist/*.whl
}
