pkgname=fprettify
pkgver=0.3.6
pkgrel=1
pkgdesc="An auto-formatter for modern Fortran code that imposes strict whitespace formatting, written in Python."
arch=('x86_64' 'i686')
license=("GPLv3")
depends=('python' 'python-future')
source=("https://github.com/pseewald/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('71932effcc2dc5d3ce55cc5333fd88fb251ebf6fdb8f60e3ed8a78d748697bcc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
