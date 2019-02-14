# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=editline
pkgver=1.15.3
pkgrel=1
pkgdesc="A readline() replacement for UNIX without termcap (ncurses)"
arch=('x86_64')
url="http://troglobit.com/editline.html"
license=('BSD')
source=("ftp://ftp.troglobit.com/editline/${pkgname}-${pkgver}.tar.xz")
sha512sums=('7566ba1616ec729fe6f60571b3ca3eef83fc9f12f530e8351976d16627ecc7fce81b7d620218ffa8a853d95fbbb397477e59dbc2dd113505ce27f790df2a7a38')


build () {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-gc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/share/man/man3/editline.3 $pkgdir/usr/share/man/man3/editline-troglobit.3
}
