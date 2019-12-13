# Maintainer: Miles McLean <mills00013@gmail.com>
# Contributor: Andrea Fagiani <andfagiani_at_gmail_dot_com>
# Contributor: hb <hb.at.spamers.dot.net>
# Contributor: Lisa Denia <eiffel56@gmail.com>

pkgname=anyremote
pkgver=6.7.3
pkgrel=1
pkgdesc="Remote control (console-oriented) through bluetooth or IR connection"
arch=('i686' 'x86_64')
url="http://anyremote.sourceforge.net"
license=('GPL3')
depends=('bluez-libs' 'bluez' 'dbus-glib' 'libxtst')
optdepends=("irda-utils: IRDA support")
install=anyremote.install
source=(http://downloads.sourceforge.net/sourceforge/anyremote/$pkgname-$pkgver.tar.gz)
md5sums=('fd87404e8f820e9b4756c38c930c8367')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
