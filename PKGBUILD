# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=libcm
pkgver=0.1.1
pkgrel=1
pkgdesc="A compositing manager library"
arch=(i686 x86_64)
url="http://ftp.gnome.org/pub/GNOME/sources/libcm/"
license=('GPL')
depends=('glib2' 'libgl' 'libxcomposite' 'libxdamage' 'mesa')
options=(!libtool)
source=(http://ftp.gnome.org/pub/GNOME/sources/libcm/0.1/$pkgname-$pkgver.tar.bz2)
md5sums=('a975d0a913dd882c0a93487b534782bc')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
