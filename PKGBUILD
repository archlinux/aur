# Contributor: lp76 <l.peduto@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=nrss
pkgver=0.3.9
pkgrel=3
pkgdesc="NCurses Feed Reader"
arch=('i686' 'x86_64')
url="http://www.codezen.org/nrss/"
license=("GPL")
source=("http://ftp.de.debian.org/debian/pool/main/n/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
depends=('ncurses' 'expat')
md5sums=('0673d5b18cee1f7229bed45db05f3c3e')
sha1sums=('8770cf5cc2c02d88055801ff259c33717f90567d')
sha256sums=('c6a421b4a5da5037ca157bfd9c1eadd3115e89984d7180f2abc90933af007602')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|ncursesw/panel.h|panel.h|' nrss.h # fixes compiling with arch ncurses
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR=$startdir/pkg install
}

