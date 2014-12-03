# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=reportbug
_python=python2
pkgver=6.6.1
pkgrel=1
pkgdesc="report bugs in the Debian distribution + python modules"
arch=('any')
url="http://packages.debian.org/sid/reportbug"
license=('MIT')
depends=('python2-debian' 'python2-debianbts' 'python2-support' 'apt'
'sensible-utils')
provides=("python2-reportbug=$pkgver")
conflicts=('python2-reportbug')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/r/$pkgname/${pkgname}_$pkgver.tar.bz2)
sha256sums=('aff6272f17a05455d94e57b4ce3ce8782519aa3c0e5ec5036af89788df533d31')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py build
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
