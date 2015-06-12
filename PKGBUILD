# Maintainer: Vladimir	Cerny <blackvladimir@gmail.com>

pkgname=gspiceui
pkgver=1.1.00
pkgrel=1
pkgdesc="A GUI to various freely available Spice electronic ciruit simulators"
url="http://users.tpg.com.au/micksw012/gspiceui.html"
license=('GPL')
depends=('wxgtk' 'pangox-compat')
optdepends=('gnucap: simulation backend'
	    'ngspice: simulation backend'
	    'gwave2: wave viewer'
	    'gaw: wave viewer')

source=(http://downloads.sourceforge.net/sourceforge/gspiceui/$pkgname-v$pkgver.tar.gz
	gspiceui.desktop)

arch=('i686' 'x86_64')

md5sums=('f159b2c65ab1ee3eaeb61414e919392e'
         'ee8b733d2bdb46f8c526fa0b04310bb9')

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

