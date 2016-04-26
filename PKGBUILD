# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-tinydb
pkgver=3.2.0
pkgrel=1
pkgdesc="Lightweight document oriented database optimized for your happiness"
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'unzip')
url="https://github.com/msiemens/tinydb"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/6c/91/a6959e7199bd6a97521be2922369d65673c89511a3ce662c865b9adbec3a/${pkgname#python-}-$pkgver.zip)
md5sums=('8584ac822a97cd77b0d68641025959c8')
sha256sums=('3d9378de3adcf0df4d76b334d6a6d834993d8d48c0a96d2ce6d2e57ca5e0a585')

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
