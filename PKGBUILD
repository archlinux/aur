# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=python2-debianbts
_pkgname=python-debianbts
_python=python2
pkgver=1.11
pkgrel=1
pkgdesc="Python interface to Debians Bug Tracking System"
arch=('any')
url="http://packages.debian.org/sid/python-debianbts"
license=('GPL2')
depends=('python2-soappy' 'python2-support')
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/p/$_pkgname/${_pkgname}_$pkgver.tar.gz)
md5sums=('6f24b4f2185a1ea6c7d7cf039ff85543')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  $_python setup.py build
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
