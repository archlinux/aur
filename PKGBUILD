# Maintainer: Emile Pesik <ristridin [at] gmail [dot] com>
# Contributor Todd Maynard <arch [at] toddmaynard [dot] com>
pkgname=setpwc
pkgver=1.3
pkgrel=2
pkgdesc="Set various aspects of Philips (and compatible) webcams."
url="http://www.vanheusden.com/setpwc/"
license=('GPL2')
optdepends=('gtksetpwc: GTK2 frontend for setpwc')
arch=('any')
install=setpwc.install
source=(http://www.vanheusden.com/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('79d5ee468c0076feb3cac473bef661d2')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  }

package() {
  #make	 DESTDIR=$pkgdir install
  #The Makefile has a hardcoded destination so we will install the binary manually instead
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 setpwc $pkgdir/usr/bin/setpwc
  }
