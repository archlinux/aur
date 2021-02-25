# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
# Contributor: Georgij Kondratjev <smpuj@bk.ru>

pkgname=gnucap
pkgver=20210107
pkgrel=1
pkgdesc="GNU Circuit Analysis Package"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('readline')
source=("http://git.savannah.gnu.org/cgit/$pkgname.git/snapshot/$pkgname-$pkgver.tar.gz")
sha1sums=('ee5ab60fdb5e5f07f65513d39bde3f008230db75')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
