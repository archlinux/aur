# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-mnemonic
pkgver=0.14
pkgrel=1
pkgdesc="Implementation of Bitcoin BIP-0039"
arch=('any')
depends=('python2' 'python2-pbkdf2')
makedepends=('python2-setuptools')
url="https://github.com/trezor/python-mnemonic"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/8d/eb/92f9f2bd0c93cf378f3496c90c78336a07189635084c8d8134717f478318/mnemonic-0.14.tar.gz)
md5sums=('bd663ebff3f524ae056e05cd4735f64b')
sha256sums=('d7ad08f4a1e53114033fd05c33f8ba9f0e847f2890cf626ea93c9734f2460b6e')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
