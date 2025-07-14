# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=flrig-git
_pkgname=flrig
__pkgname=fldigi
pkgver=2.0.08.r0.g2d9aa65c
#.r0.g2d9aa65c
#.r0.g047aadb
#.r0.gb05b001
pkgrel=2
pkgdesc="Ham Radio - Xcvr control program - GIT version"
arch=('armv7h' 'i686' 'x86_64' 'aarch64')
url="http://www.w1hkj.com/flrig-help/index.html"
license=('GPL')
depends=('fltk<1.5' 'flxmlrpc>=1.0.1' 'systemd-libs' 'hamradio-menus')
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
