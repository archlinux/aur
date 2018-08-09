# Maintainer: Rich Li <rich at dranek com>
# Contributor: Thomas Haider <t.haider@deprecate.de>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Samed Beyribey <ras0ir@eventualis.org>
pkgname=python-authres
_pkgname=authentication-results-python
pkgver=1.1.0
pkgrel=1
pkgdesc="Python Authentication-Results headers generation and parsing"
arch=('any')
url="http://launchpad.net/authentication-results-python"
license=('Apache')
depends=('python')
conflicts=('python2-authres')
source=("https://launchpad.net/$_pkgname/${pkgver%.*}/$pkgver/+download/authres-$pkgver.tar.gz")
sha256sums=('dbec6f213146550421fbd2295e7d0122e899c42ca10e2b85e27088cc33a494d5')
 
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

