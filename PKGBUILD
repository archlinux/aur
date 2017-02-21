# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=flrig-git
_pkgname=flrig
__pkgname=fldigi
pkgver=1.3.28.r0.gb05b001
#.r0.gb05b001
pkgrel=1
pkgdesc="Ham Radio - Xcvr control program - GIT version"
arch=('i686' 'x86_64')
url="https://sourceforge.net/p/fldigi/flrig/ci/master/tree/"
license=('GPL')
depends=('fltk' 'flxmlrpc')
makedepends=('git' 'autoconf' 'automake' 'pkg-config')
optdepends=('hamradio-menus: XDG compliant menuing'
	    'fldigi: for digital mode interface')
provides=('flrig')
conflicts=('flrig')
source=("$_pkgname::git://git.code.sf.net/p/$__pkgname/$_pkgname#branch=master")

pkgver() {
	cd $srcdir/$_pkgname

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $srcdir/$_pkgname

	autoreconf --install
}

build() {
	cd $srcdir/$_pkgname
			 
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$_pkgname

	make prefix=$pkgdir/usr install
}                                                  
md5sums=('SKIP')
sha256sums=('SKIP')
