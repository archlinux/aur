# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=python-debian
_python=python
pkgver=0.1.21_nmu2
_pkgver=0.1.21-nmu2
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
source=(http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$_pkgver.tar.gz)
md5sums=('09c0b6ce10bf473c54fff9e6c62fe1d6')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  $_python setup.py build
}
package() {
  cd "$srcdir/$pkgname-$_pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
