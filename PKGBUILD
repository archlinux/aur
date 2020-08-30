# Maintainer: David Parrish
# Contributor: David Parrish <daveparrish@tutanota.com>

pkgname=python-bitcointx
pkgver=1.1.1
pkgrel=1
pkgdesc="An easy interface to the bitcoin transaction data structures"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/petertodd/python-bitcoinlib"
license=('LGPL3')
options=(!emptydirs)
source=("$pkgname-v$pkgver.tar.gz"::"https://github.com/Simplexum/python-bitcointx/archive/python-bitcointx-v${pkgver}.tar.gz")
sha256sums=('35edd694473517508367338888633954eaa91b2622b3caada8fd3030ddcacba2')

build() {
  ls -alh && pwd
  cd "$srcdir/$pkgname-$pkgname-v$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgname-v$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
