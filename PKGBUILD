# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=flrig-git
_pkgname=flrig
__pkgname=fldigi
pkgver=1.4.04.r0.g047aadb
#.r0.gb05b001
pkgrel=2
pkgdesc="Ham Radio - Xcvr control program - GIT version"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/flrig-help/index.html"
license=('GPL')
depends=('fltk' 'flxmlrpc>=1.0.1' 'systemd-libs' 'hamradio-menus')
makedepends=('git' 'autoconf' 'automake' 'pkg-config')
optdepends=('fldigi: for digital mode interface')
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
