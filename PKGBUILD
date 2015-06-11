# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=wmnet
pkgver=1.06
pkgrel=4
pkgdesc="A network monitor applet for WindowMaker"
arch=('i686' 'x86_64')
url="http://www.katharineosborne.com/wmnet/"
license=('GPL')
depends=('libxext')
makedepends=('imake')
source=(http://www.sfr-fresh.com/linux/misc/old/$pkgname-$pkgver.tar.gz)
md5sums=('64e74c37c0cb5fd4fb81cfb0f5c4a264')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  xmkmf
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install.man
}
