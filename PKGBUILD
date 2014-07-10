# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=python2-debianbts
_pkgname=python-debianbts
_python=python2
pkgver=1.12
pkgrel=1
pkgdesc="Python interface to Debians Bug Tracking System"
arch=('any')
url="http://packages.debian.org/sid/python-debianbts"
license=('GPL2')
depends=('python2-soappy' 'python2-support')
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/p/$_pkgname/${_pkgname}_$pkgver.tar.xz)
sha256sums=('1b3e6b8a9618e63bb9f6f945230588cdcb273fb1fcb959c9811d435e1b0e896f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  $_python setup.py build
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
