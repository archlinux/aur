pkgname=python-ssdeep
pkgver=3.4.1
pkgrel=1
pkgdesc='Python wrapper for ssdeep fuzzy hashing library'
arch=('i686' 'x86_64')
license=('LGPL3')
url='https://pypi.python.org/pypi/ssdeep'
makedepends=('python-build' 'python-installer' 'python-wheel' 'ssdeep' 'python-pytest-runner')
depends=('python' 'python-cffi' 'ssdeep')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DinoTools/python-ssdeep/archive/${pkgver}.tar.gz")
sha256sums=('6f984a1248ee6b434bab0e2b274621f1888d81b8241858d30f981214263b17fa')

build() {
   cd $pkgname-$pkgver
   python -m build --wheel --no-isolation
}

package() {
   cd $pkgname-$pkgver
   python -m installer --destdir="$pkgdir" dist/*.whl
} 
