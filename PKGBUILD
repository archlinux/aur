# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=distro-info-data
pkgver=0.21
pkgrel=1
pkgdesc="information about the distributions' releases (data files)"
arch=('any')
url="http://packages.debian.org/sid/distro-info-data"
license=('MIT')
depends=()
makedepends=('python2')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('89fda7cd33036950eaa7d0bbd8b0a9abceccb2ed3cd15535fe3d4591796d61fd')

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
