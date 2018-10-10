# Maintainer: lth <manuelung@gmail.com>
# Contributor: nizox <nizzox@gmail.com>
pkgname=dhcpcd-dbus
pkgver=0.6.1
pkgrel=1
pkgdesc="DBus bindings for dhcpcd"
url="http://roy.marples.name/projects/dhcpcd"
license=("BSD")
depends=("dbus" "dhcpcd>=5.0")
source=(http://roy.marples.name/downloads/dhcpcd/$pkgname-$pkgver.tar.bz2)
arch=(i686 x86_64)
md5sums=('3e0762be2f2336dceebaa319f388c8dd')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/ --libexecdir=/usr/lib/dhcpcd-dbus

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install 

  install -d $pkgdir/usr/share/licenses/$pkgname
}
