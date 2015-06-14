# Maintainer:  Acidhub <acidhub@craft.net.br>

pkgname=mount-gtk
pkgver=1.4.3
pkgrel=1
pkgdesc="A simple graphical front end for udisks and mount in GTK3"
arch=('i686' 'x86_64')
url="http://mount-gtk.sourceforge.net/"
license=('GPL')
depends=('c++-gtk-utils>=2.0.9' 'gtk3>=2.99.0' 'udisks2>=1.94.0')
optdepends=('libnotify: error notifications')
options=('!buildflags')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('6a245837c68214c133af96239aa772461074e57115a229ec695b2d5dbd9d2fe6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
