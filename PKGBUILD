pkgname=fprettify
pkgver=0.3.1
pkgrel=1
pkgdesc="An auto-formatter for modern Fortran code that imposes strict whitespace formatting, written in Python."
arch=('x86_64' 'i686')
license=("GPLv3")
depends=('python' 'python-future')
source=("https://github.com/pseewald/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5b135252f8b562af1a673d2cb64c94c8bdaed41a0038e5e115307a552a859d5d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}