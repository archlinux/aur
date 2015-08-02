# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=wumwum
pkgver=0.9
pkgrel=4
pkgdesc="The Window Manager manager. It can turn emwh compliant window managers into a tiling window manager while retaining all initial functionalities. "
arch=('i686' 'x86_64')
url="http://wumwum.sourceforge.net/"
license=('GPL3')
depends=('wmctrl' 'libaosd' 'xorg-utils')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz)

md5sums=('a2bcc7c22a7f2083cbda0d5e00849cc0')

build() {
  cd $pkgname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" INSTALLVENDORSCRIPT=/usr/bin install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
