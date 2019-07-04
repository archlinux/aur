# Maintainer: Vladimir	Cerny <blackvladimir@gmail.com>

pkgname=gspiceui
pkgver=1.2.36
pkgrel=1
pkgdesc="A GUI to various freely available Spice electronic ciruit simulators"
url="http://users.tpg.com.au/micksw012/gspiceui.html"
license=('GPL')
depends=('wxgtk')
optdepends=('gnucap: simulation backend'
	    'ngspice: simulation backend'
	    'gaw: wave viewer')

md5sums=('a385028952ada5aa69acdb7298332c8c'
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

