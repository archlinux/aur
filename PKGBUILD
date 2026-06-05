# Maintainer: amalxloop <amalrockz568@gmail.com>

pkgname=python-commiefetch
pkgver=1.2.1
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
sha256sums=('11b48c9de843383a80f3860b3cd2c34b21ccae2b5d2e06443d8b668b0fd1ef0d')

build() {
  cd "$srcdir/commiefetch-$pkgver"
  python -m build --wheel --no-sdist
}

package() {
  cd "$srcdir/commiefetch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
