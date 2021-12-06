# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pysodium
pkgver=0.7.10
pkgrel=1
pkgdesc="Python wrapper for libsodium"
arch=('any')
depends=('libsodium' 'python2')
makedepends=('python2-setuptools')
url="https://github.com/stef/pysodium"
license=('BSD')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/88/84/6d5eb564d6aa7a717a99d2bf0d9b6fb5877c44c3dcf48f082e39a67304f6/pysodium-0.7.10.tar.gz)
sha256sums=('3e81b91472df6c166f31d8b7e8ccbe2e768c113a6c1472f1422d151ebe20f17d')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
