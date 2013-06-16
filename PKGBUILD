# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=distro-info-data
pkgver=0.16
pkgrel=1
pkgdesc="information about the distributions' releases (data files)"
arch=('any')
url="http://packages.debian.org/sid/distro-info-data"
license=('MIT')
depends=()
makedepends=('python2')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.gz)
md5sums=('12b88c7459b779885290db3a31229fc8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1s/python$/python2/' validate-csv-data
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
