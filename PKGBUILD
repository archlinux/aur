# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>

pkgname=leafpad
pkgver=0.8.17
pkgrel=1
pkgdesc="A notepad clone for GTK+ 2.0"
arch=('i686' 'x86_64')
url="http://tarot.freeshell.org/leafpad/"
license=('GPL')
depends=('gtk2')
makedepends=('perlxml')
install=leafpad.install
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d39acdf4d31de309d484511bdc9f5924')
sha1sums=('d13f585f3b2d9ea263102e1abb9fc688e3e5874a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-chooser || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  echo 'StartupNotify=true' >> "$pkgdir/usr/share/applications/leafpad.desktop" || return 1
}
