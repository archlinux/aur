# Maintainer: David Parrish
# Contributor: David Parrish <daveparrish@tutanota.com>

pkgname=python-bitcointx
pkgver=1.1.3
pkgrel=3
pkgdesc="An easy interface to the bitcoin transaction data structures"
arch=('any')
depends=('libsecp256k1')
optdepends=('libbitcoin-consensus' 'openssl')
makedepends=('python-setuptools')
url="https://github.com/Simplexum/python-bitcointx"
license=('LGPL3')
options=(!emptydirs)
source=("$pkgname-v$pkgver.tar.gz"::"https://github.com/Simplexum/python-bitcointx/archive/python-bitcointx-v${pkgver}.tar.gz")
sha256sums=('f0f487c29619df0e94a04f6deb3dc950ff9954c072017bd3eda90f73c24f0953')

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
