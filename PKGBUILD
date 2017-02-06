# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=distro-info-data
pkgver=0.33
pkgrel=1
pkgdesc="information about the distributions' releases (data files)"
arch=('any')
url="http://packages.debian.org/sid/distro-info-data"
license=('MIT')
depends=()
makedepends=('python2')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('f3911646750b9fa99018138dc8f9661e14b6e549dc251b66eaeeaf901162d10e')

build() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname"
  sed -i '1s/python$/python2/' validate-csv-data
}

check() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname"
  make test
}

package() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 debian/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
