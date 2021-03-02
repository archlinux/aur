# Maintainer: Miles McLean <mills00013@gmail.com>
# Contributor: Andrea Fagiani <andfagiani_at_gmail_dot_com>
# Contributor: hb <hb.at.spamers.dot.net>
# Contributor: Lisa Denia <eiffel56@gmail.com>

pkgname=anyremote
pkgver=6.7.3
pkgrel=2
pkgdesc="Remote control (console-oriented) through bluetooth or IR connection"
arch=('i686' 'x86_64')
url="http://anyremote.sourceforge.net"
license=('GPL3')
depends=('bluez-libs' 'bluez' 'dbus-glib' 'libxtst')
optdepends=('ganyremote: GTK frontend'
            'kanyremote: Qt frontend'
            'irda-utils: IRDA support'
            'avahi: advertise service through Avahi'
            'pngout: upload icons to JSR-82 compatible phone'
            'wmctrl'
            'imagemagick')
install=anyremote.install
source=(https://downloads.sourceforge.net/sourceforge/anyremote/$pkgname-$pkgver.tar.gz)
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
