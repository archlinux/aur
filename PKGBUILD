pkgname=swath
pkgver=0.5.2
pkgrel=3
pkgdesc="A general-purpose utility for analyzing word boundaries in Thai text and inserting predefined word delimiter codes"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gcc-libs' 'libdatrie>=0.2.1')
groups=('texlive-lang')
source=(ftp://linux.thai.net/pub/thailinux/software/swath/$pkgname-$pkgver.tar.xz)
url="http://linux.thai.net/projects/swath"
md5sums=('837b313d17de9c4bcdfd0164f8df9365')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:
