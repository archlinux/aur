pkgname=fprettify
pkgver=0.3.5
pkgrel=1
pkgdesc="An auto-formatter for modern Fortran code that imposes strict whitespace formatting, written in Python."
arch=('x86_64' 'i686')
license=("GPLv3")
depends=('python' 'python-future')
source=("https://github.com/pseewald/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('af7737d29f56f80cb6f6104fa0484d33163423026e443426bc3b57b12d5a37ac')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
