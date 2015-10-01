# Maintainer: Corelli <corelli AT yepmail DOT net>
# Contributor: Gadget3000 <Gadget3000@msn.com>
pkgname=mp3check
pkgver=0.8.7
pkgrel=1
pkgdesc="Check mp3 files for consistency plus fix header and id3tag errors"
arch=('i686' 'x86_64')
url="https://code.google.com/p/mp3check/"
license=('GPL')
source=(https://mp3check.googlecode.com/files/mp3check-${pkgver}.tgz)
md5sums=(83f5fd6514a55c88126725275aa2d1d5)
depends=(gcc-libs)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m755 mp3check ${pkgdir}/usr/bin/mp3check
}
 
