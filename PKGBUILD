# Contributor: Hyperair <hyperair@gmail.com>
pkgname=tsclient
pkgver=0.150
pkgrel=2
pkgdesc="Terminal Server Client [tsclient] is a GTK2 frontend for rdesktop and other remote desktop tools."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tsclient"
license=('GPL')
depends=('rdesktop>=1.3' 'gnome-panel>=2.0')
makedepends=('perlxml' 'sharutils')
install=tsclient.install
source=(http://downloads.sf.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1dc95fbdbcf4344d05114e1f43bf32ea')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
