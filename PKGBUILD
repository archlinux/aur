# Maintainer:Vadim Ushakov < igeekless@gmail.com >
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=wmjump
pkgver=1.2.2
pkgrel=1
pkgdesc="A tool to switch between windows using keyboard"
arch=('i686' 'x86_64')
url="http://code.google.com/p/wmjump"
license=('GPL2')
depends=('gtk2')
source=(http://wmjump.googlecode.com/files/wmjump_$pkgver.tar.gz)
md5sums=('f3780a892fc25e3575023a784c0db72c') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}

# vim:set ts=2 sw=2 et:
