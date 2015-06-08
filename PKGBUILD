# Maintainer: Rich Li <rich at dranek com>
# Contributor: Thomas Haider <t.haider@deprecate.de>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Samed Beyribey <ras0ir@eventualis.org>
pkgname=python-authres
_pkgname=authentication-results-python
pkgver=0.800
_pkgver=0.8
pkgrel=1
pkgdesc="Python Authentication-Results headers generation and parsing"
arch=('any')
url="http://launchpad.net/authentication-results-python"
license=('Apache')
depends=('python')
conflicts=('python2-authres')
source=(https://launchpad.net/$_pkgname/$pkgver/$_pkgver/+download/authres-$pkgver.tar.gz)
sha256sums=('d28e3976a7d418917cbbf384018aa0e8a0489e41bfd9847309c5f8efb19f6efd')
 
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
  python setup.py install --root=$pkgdir --optimize=1
}

