# Maintainer: lth <manuelung@gmail.com>
# Contributor: nizox <nizzox@gmail.com>
pkgname=dhcpcd-dbus
pkgver=0.6.0
pkgrel=2
pkgdesc="DBus bindings for dhcpcd"
url="http://roy.marples.name/projects/dhcpcd-dbus"
license=("BSD")
depends=("dbus-core" "dhcpcd>=5.0")
source=(http://roy.marples.name/downloads/dhcpcd/$pkgname-$pkgver.tar.bz2)
arch=(i686 x86_64)
md5sums=('4fd43b0f0ca7c0e65f95a0b2846b37b7')

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
