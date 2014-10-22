# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=python-debian
_python=python
pkgver=0.1.24
pkgrel=1
pkgdesc="Python modules to work with Debian-related data formats"
arch=('any')
url="http://packages.debian.org/sid/python-debian"
license=('GPL')
depends=($_python $_python-chardet $_python-six)
optdepends=("$_python-apt: interface to libapt-pkg")
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/p/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('da36ac47d8b929af12d6889c974159e00c9f7372b84041b6663bb9114e83b854')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py build
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
