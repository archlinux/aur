# Maintainer: Riccardo Berto <riccardobrt at gmail>
# previous: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-tinydb
pkgver=3.11.1
pkgrel=1
pkgdesc="Lightweight document oriented database optimized for your happiness"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/msiemens/tinydb"
license=('MIT')
options=(!emptydirs)
source=($url/archive/v$pkgver.tar.gz)
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

}
