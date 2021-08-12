# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=libdevlock
pkgver=1.0.9.2
pkgrel=0
pkgdesc="provides an API for manupulating device lock code stored in CAL"
url="https://github.com/maemo-leste/$pkgname"
arch=(any)
license=(LGPL2)
depends=(libcal glib2 gconf) 
makedepends=()
checkdepends=()
groups=(mer)
#source=("https://github.com/maemo-leste/mce/archive/$_commit/mce-$_commit.tar.gz"
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('SKIP')

 build() {
  cd $pkgname
  DESTDIR=$pkgdir PREFIX=/usr _UNITDIR=/usr/lib/systemd make
 }

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
  ln -s $pkgname.so.1.0.9 "$pkgdir"/usr/lib/$pkgname.so
  mv $pkgdir/bin $pkgdir/usr/bin
}
