# Maintainer: amalxloop <amalrockz568@gmail.com>

pkgname=python-commiefetch
pkgver=1.1.9
pkgrel=1
pkgdesc="Communist-themed system information tool — like neofetch, but red"
arch=('any')
url="https://github.com/amalxloop/commiefetch"
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('commiefetch')
conflicts=('commiefetch')
source=("commiefetch-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/commiefetch/commiefetch-$pkgver.tar.gz")
sha256sums=('2b1c244f3a8bbe6fac44b76539f63f20d37f99e7e2961abe84b5dde44762b94d')

build() {
  cd "$srcdir/commiefetch-$pkgver"
  python -m build --wheel --no-sdist
}

package() {
  cd "$srcdir/commiefetch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
