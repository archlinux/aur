# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=passpie
pkgver=1.3.1
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
source=(https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3936dffca0ece9a7821f224def6b2844')
sha256sums=('90106e09b1d2609bcf6476157cafd42cfd639cd718a26a55674d87ccb9303b29')

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
