# Maintainer: amalxloop <amalrockz568@gmail.com>

pkgname=python-commiefetch
pkgver=1.0.0
pkgrel=1
pkgdesc="Communist-themed system information tool — like neofetch, but red"
arch=('any')
url="https://github.com/amalxloop/commiefetch"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('commiefetch')
conflicts=('commiefetch')
source=("commiefetch-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/commiefetch/commiefetch-$pkgver.tar.gz")
sha256sums=('28a5437df3375c74f5b1ba5c46418cfd87bcf7a49b8feaf93f3238a1a93e53c0')

build() {
  cd "$srcdir/commiefetch-$pkgver"
  python -m build --wheel --no-sdist
}

package() {
  cd "$srcdir/commiefetch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
