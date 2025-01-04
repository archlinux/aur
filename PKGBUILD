pkgname=fprettify
pkgver=0.3.7
pkgrel=2
pkgdesc="An auto-formatter for modern Fortran code that imposes strict whitespace formatting, written in Python."
arch=('x86_64' 'i686')
license=("GPLv3")
depends=('python')
source=("https://github.com/pseewald/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('052da19a9080a6641d3202e10572cf3d978e6bcc0e7db29c1eb8ba724e89adc7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
