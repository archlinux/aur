# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: Imanol Celaya <ilcra1989@gmail.com>
pkgname=flwm
pkgver=1.02
pkgrel=3
pkgdesc="Fast Light Window Manager"
arch=('i686' 'x86_64')
url="http://flwm.sourceforge.net/"
license=('GPL')
depends=('fltk')
source=(http://flwm.sourceforge.net/flwm-$pkgver.tgz)
md5sums=('33e1738441c351153a9c0a83a051bf7c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 flwm "$pkgdir/usr/bin/flwm"
  install -Dm644 flwm.1 "$pkgdir/usr/share/man/man1/flwm.1"
}
