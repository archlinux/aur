# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=passpie
pkgver=1.4.2
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
source=(https://pypi.python.org/packages/75/74/81b61b369c029454647c0a662d08c76bb7fe4757cf761c3890884b71096d/passpie-1.4.2.tar.gz)
md5sums=('87b6a905b290b0db4f4d3a4f70bdea69')
sha256sums=('c6faf0b6cb1a1c8f942b93fbe43b10e66a06bae1b263e544e7cd26add5b130a7')

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
