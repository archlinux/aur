# Maintainer :  David Phillips <dbphillipsnz@gmail.com>
# Contributor:  Acidhub <contact@acidhub.click>

pkgname=mount-gtk
pkgver=1.4.4
pkgrel=1
pkgdesc="A simple graphical front end for udisks and mount in GTK3"
arch=('i686' 'x86_64')
url="http://mount-gtk.sourceforge.net/"
license=('GPL')
depends=('c++-gtk-utils>=2.0.9' 'gtk3>=2.99.0' 'udisks2>=1.94.0')
optdepends=('libnotify: error notifications')
options=('!buildflags')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('ccdc5c71a8c278a735c6e36374046bb9cb4d2e9d7b343a8c260ced8bb448f36c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
