# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Vladimir	Cerny <blackvladimir@gmail.com>

pkgname=gspiceui
pkgver=1.2.87
pkgrel=1
pkgdesc="A GUI to various freely available Spice electronic ciruit simulators"
url="http://users.tpg.com.au/micksw012/gspiceui.html"
license=('GPL')
depends=('wxgtk2')
optdepends=('gnucap: simulation backend'
	    'ngspice: simulation backend'
	    'gaw: wave viewer')

md5sums=('ae580ac1665674fda3b7029392695157'
         'ee8b733d2bdb46f8c526fa0b04310bb9')

source=(http://downloads.sourceforge.net/sourceforge/gspiceui/$pkgname-v$pkgver.tar.gz
	gspiceui.desktop)

arch=('i686' 'x86_64')

build(){
  cd $srcdir/$pkgname-v$pkgver
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1
  cd $srcdir/$pkgname-v$pkgver
  make DESTDIR=$pkgdir/usr install 
  install -D -m644 $srcdir/gspiceui.desktop $pkgdir/usr/share/applications/gspiceui.desktop
}

