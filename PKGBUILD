# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-tinydb
pkgver=3.1.1
pkgrel=1
pkgdesc="Lightweight document oriented database optimized for your happiness"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/msiemens/tinydb"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('fb2c7ec72fe913b7a47a0b5bdbb06aea')
sha256sums=('b704d94b44c5dbc4f4b038f22aa30b4c7398a8d52881767b4e53edeaeab6d3d0')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg2 'Cleaning up pkgdir...'
  rm -rf "$pkgdir/usr/lib/python3.5/site-packages/tests"
}
