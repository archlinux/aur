# Maintainer: amalxloop <amalrockz568@gmail.com>

pkgname=python-commiefetch
pkgver=1.1.1
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
sha256sums=('19889f980dba6ba9e422cc79b3a8f9cef08d004a483b2a0e44b5a42cf4ad34bd')

build() {
  cd "$srcdir/commiefetch-$pkgver"
  python -m build --wheel --no-sdist
}

package() {
  cd "$srcdir/commiefetch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
