# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-tinydb
pkgver=3.1.3
pkgrel=1
pkgdesc="Lightweight document oriented database optimized for your happiness"
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'unzip')
url="https://github.com/msiemens/tinydb"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/${pkgname#python-}/${pkgname#python-}-$pkgver.zip)
md5sums=('4c3e1c73e404bb7bf9e3bddba405b313')
sha256sums=('c46d46e5e4e632df47c75d8bf402f3d8e08a468e782b5475398dc6ac6448e16d')

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
