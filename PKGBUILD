# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=python-discid
_pkgname=discid
_python=python
pkgver=1.0.0
pkgrel=1
pkgdesc="Python binding of Libdiscid"
arch=('any')
url="https://python-discid.readthedocs.org/"
license=('LGPL3')
depends=('python>=3.1' 'libdiscid>=0.2.2')
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/d/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('88325ccb882c1c31d86ebe10263f0f64')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  $_python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  $_python setup.py test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
