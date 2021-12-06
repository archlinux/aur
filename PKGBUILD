pkgname=xbacklight-auto-git
pkgbase=xbacklight-auto
pkgver=0.7
pkgrel=0
pkgdesc="Automatic brightness utility using the V4L2 camera api and xbacklight"
arch=('i686' 'x86_64')
license=('GPL')
depends=('xorg-xbacklight') # acpilight should work too
provides=('xbacklight-auto')
source=("git+https://github.com/raptor8134/xbacklight-auto.git")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${pkgbase}
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	cd $srcdir/$pkgbase
	make DESTDIR=$pkgdir/ install
}
