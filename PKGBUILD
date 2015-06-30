# Maintainer: Jasper Follas follasjj@live.co.uk

pkgname=bsp
pkgver=5.2
pkgrel=7
pkgdesc="The most popular nodebuilder for DOOM"
arch=('i686' 'x86_64')
license=('CCPL:by-sa')
url="http://games.moria.org.uk/doom/bsp/"
depends=('pygtk' 'librsvg' 'glibc')
source=(http://games.moria.org.uk/doom/bsp/download/$pkgname-$pkgver.tar.bz2)
md5sums=('6f29fc0d5ca0512c34482843b0a1fcb3')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
