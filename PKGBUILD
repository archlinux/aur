# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=passpie
pkgver=1.4.3
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
source=(https://pypi.python.org/packages/6b/d1/e198766fee560af7d6568f213209c7f377376edaa326a7d5802ef5262aa5/passpie-1.4.3.tar.gz)
md5sums=('2b6e61152a4dfec665b1ed02b08a2673')
sha256sums=('c6778a65fd7c1e00be94cc39a0468f04509d0c14b3686a1788f2012917b1d2fc')

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
