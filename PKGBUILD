# Maintainer: Rich Li <rich at dranek com>
# Contributor: Thomas Haider <t.haider@deprecate.de>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Samed Beyribey <ras0ir@eventualis.org>
pkgname=python-authres
_pkgname=authentication-results-python
pkgver=0.900
pkgrel=1
pkgdesc="Python Authentication-Results headers generation and parsing"
arch=('any')
url="http://launchpad.net/authentication-results-python"
license=('Apache')
depends=('python')
conflicts=('python2-authres')
source=("https://launchpad.net/$_pkgname/$pkgver/$pkgver/+download/authres-$pkgver.tar.gz"
        "https://launchpad.net/$_pkgname/$pkgver/$pkgver/+download/authres-$pkgver.tar.gz.asc")
sha256sums=('de91d6cc6e5c6fef545bbf0a810a765fab4ca162906d14f3f2a6b9858602c186'
            'SKIP')
validpgpkeys=('E7729BFFBE85400FEEEE23B178D7DEFB9AD59AF1')  # Donald Scott Kitterman <scott@kitterman.com>
 
build() {
  cd "$srcdir/authres-$pkgver"
  python setup.py build 
}

check() {
  cd "$srcdir/authres-$pkgver"
  # python -m authres -v
  python -m authres
}

package() {
  cd "$srcdir/authres-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}

