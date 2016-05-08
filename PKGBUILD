# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=('python2-debianbts' 'python-debianbts')
_pkgname=python-debianbts
pkgver=2.6.0
pkgrel=1
pkgdesc="Python interface to Debians Bug Tracking System"
arch=('any')
url="http://packages.debian.org/sid/python-debianbts"
license=('GPL2')
makedepends=('python-pysimplesoap' 'python2-pysimplesoap')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/p/$_pkgname/${_pkgname}_$pkgver.tar.xz)
sha256sums=('61781b5aa708c27b0bbbec5a72ff71c6770a453ce64ffae9d23c815031956231')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package_python-debianbts() {
  depends=('python-pysimplesoap')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-debianbts() {
  depends=('python2-pysimplesoap')
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
