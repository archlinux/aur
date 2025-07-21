# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>

pkgname=pidgin-toobars
pkgver=1.14
pkgrel=2
pkgdesc='Pidgin plugin that adds a toolbar and status bar to the buddy list'
arch=('x86_64')
url='http://vayurik.ru/wordpress/en/toobars/'
license=('GPL')
depends=('pidgin')
makedepends=('intltool')
source=(pidgin-toobars-1.14.tar::https://web.archive.org/web/20250226154908if_/https://vayurik.ru/wordpress/wp-content/uploads/toobars/1.14/pidgin-toobars-1.14.tar.gz msgfmt.patch)
#md5sums=('0b9255902c10ec1b171329474bd69e82')
md5sums=('ed51c513cc746673ada4bc9d89946e88'
         '65be5df61da0f737cf2fcdfbd25eaef4')

build() {
  cd $pkgname-$pkgver
  patch -p1 -i $srcdir/msgfmt.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
