# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds
#

pkgname=pdh
pkgver=0.3.16
pkgrel=1
pkgdesc="Pagerduty CLI for humans"
arch=('any')
url="https://github.com/mbovo/pdh"
license=('APACHE')
depends=('python-click' 'python-colorama' 'python-rich' 'python-pyaml' 'python-pdpyras')
makedepends=(python-build python-installer python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('aec584b8e26ba700a9ca4895ab31cc8e987a51a39f66f8038058cb099533f145')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   python -m build --wheel --no-isolation
}

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python -m installer --destdir="$pkgdir" dist/*.whl
}
