# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=python-debian
_python=python
pkgver=0.1.22
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
sha256sums=('c055dccdc5d9a762f90ce82eeab6610727cd56a29f6db2b68fce763ac5b942e0')

build() {
  cd "$srcdir/$pkgname"
  $_python setup.py build
}
package() {
  cd "$srcdir/$pkgname"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
