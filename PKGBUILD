# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
arch=(i686 x86_64)
pkgname=fnfx
pkgver=0.3
pkgrel=4
pkgdesc="Enables owners of Toshiba laptops to change the LCD brightness, control the internal fan and use the special keys on their keyboard (Fn-x combinations, hotkeys)."
url="http://fnfx.sourceforge.net/"
license=('GPL2')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('62e5c7f6457eabc02b2162cb365fd496982a33b83564d98b16abde54c876ec93273fbf5afcf9f9596e6e7577fe6d8b82f8a954adc8334f5648f2fb67b4e23d8f')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
}

package(){
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}