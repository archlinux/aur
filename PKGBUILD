# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Andrés R. <andthesito at gmail dot com>

pkgname=wmudmount
pkgver=1.13
pkgrel=2
pkgdesc='A filesystem mounter dockapp that uses udisks.'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/$pkgname/"
license=('GPL')
groups=('x11')
depends=('dbus-glib' 'gtk2' 'hicolor-icon-theme' 'libgnome-keyring' 'libnotify')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('988955faca6db4f9c4d26f8b79a38744')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --disable-gtk-withdrawn-hack --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

