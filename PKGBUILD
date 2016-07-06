# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=passpie
pkgver=1.5.1
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
source=(https://pypi.python.org/packages/4f/f5/93b7b987b6964108ca3c9e4b22150addd6a44e6afeb1fb22310f54e390d7/passpie-1.5.1.tar.gz)
md5sums=('139370926d5d5ff32e5fd9370b9b799d')
sha256sums=('d6dcfb1b0760396f54b37ce1b156ab81da20f4b1eb18c3ba6b0d50b6332cb000')

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
