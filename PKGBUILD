# Contributor:  David Phillips <dbphillipsnz@gmail.com>
# Contributor:  Acidhub <contact@acidhub.click>
# Contributor: tee < teeaur at duck dot com >

pkgname=mount-gtk
pkgver=1.4.5.1
pkgrel=1
pkgdesc="A simple graphical front end for udisks and mount in GTK3"
arch=("x86_64")
url="https://mount-gtk.sourceforge.net"
license=('GPL-2.0-only')
depends=('c++-gtk-utils>=2.1.0' 'gtk3>=2.99.0' 'udisks2>=1.94.0')
optdepends=('libnotify: error notifications')
options=('!buildflags')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a98eb27b9cf5168272c4e086b89ef2ce399f409b7f961e6140978b33d95bf848')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
