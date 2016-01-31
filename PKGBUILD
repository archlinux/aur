# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-tinydb
pkgver=3.1.2
pkgrel=1
pkgdesc="Lightweight document oriented database optimized for your happiness"
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'unzip')
url="https://github.com/msiemens/tinydb"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/${pkgname#python-}/${pkgname#python-}-$pkgver.zip)
md5sums=('b06cbaf837a6dfe7332dbe6fde3ff11e')
sha256sums=('6d9df6c30fc37dad487c23bfadfa6161de422a7f2b16b55d779df88559fc9095')

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
