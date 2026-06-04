# Maintainer: amalxloop <amalrockz568@gmail.com>

pkgname=python-commiefetch
pkgver=1.1.5
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
sha256sums=('794922cf5a7f53ec73a82e1b4b4d43f77504f0dba0dab8e0b04819df7c412546')

build() {
  cd "$srcdir/commiefetch-$pkgver"
  python -m build --wheel --no-sdist
}

package() {
  cd "$srcdir/commiefetch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
