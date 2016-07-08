# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=passpie
pkgver=1.5.2
pkgrel=1
pkgdesc="Manage login credentials from terminal"
arch=('any')
depends=('gnupg'
         'python'
         'python-click'
         'python-rstr'
         'python-tabulate'
         'python-tinydb'
         'python-yaml')
makedepends=('python-setuptools')
url="https://github.com/marcwebbie/passpie"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/a2/59/9c7adf9f005d4d51a60d569c2ea613f67aa326e84b585ac21651b482058e/passpie-1.5.2.tar.gz)
md5sums=('937bf55c1579efc4e3293896f37fb9c3')
sha256sums=('e5b7b4979db65b2f3f058325a1e174aa64cad39fb7b8043d822d3353d7e3802b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg2 'Cleaning up pkgdir...'
  rm -rf "$pkgdir/usr/lib/python3.5/site-packages/tests"
}
