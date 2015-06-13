# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contriburor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>

pkgname=mxml-dc
pkgver=2.2.2
pkgrel=1
pkgdesc="An older version of a small XML parsing library for Dreamchess"
arch=('i686' 'x86_64')
url="http://www.minixml.org/"
license=('LGPL')
provides=(mxml)
conflicts=(mxml)
source=("http://www.msweet.org/files/project3/mxml-$pkgver.tar.gz")
md5sums=('ef69862ad30ef2fe66457415db5b5ab4')

build() {
  cd "$srcdir/mxml-$pkgver"
#  [ "$CARCH" = x86_64 ] && export CFLAGS="$CFLAGS -fPIC"
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "$srcdir/mxml-$pkgver"
  make DSTROOT="$pkgdir" install
  chmod -x "$pkgdir/usr/lib/libmxml.a"
}
