# Contributors:
#   post <postwannabe@gmail.com>
#   henning mueller <henning@orgizm.net>
#   John Preston <gizmoguy1@gmail.com>

pkgname=silc-client
pkgver=1.1.11
pkgrel=1
pkgdesc='A Secure Internet Live Conferencing client'
arch=(i686 x86_64)
license=(GPL)
url=http://silcnet.org
depends=(silc-toolkit glib2 ncurses pcre)
makedepends=(yasm)
backup=(etc/silc.conf)
source=(
  https://downloads.sourceforge.net/project/silc/silc/client/sources/$pkgname-$pkgver.tar.gz
)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --without-perl --with-pic
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

sha256sums=('8cedf2f3c15322296afe094de60504bc27e349f1942713a2f322c7ef6ad5089e')
