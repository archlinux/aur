# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=linsim
pkgver=2.0.3
#.r1.g2c8072f
pkgrel=1
pkgdesc="Ham Radio - Digital Mode/HF propagation evaluation tool"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/files/test_suite/guide.html"
license=('GPL3')
depends=('fltk' 'libsamplerate')
optdepends=('hamradio-menus: XDG compliant menuing')
makedepends=('automake' 'autoconf' 'pkg-config')
source=("$pkgname::git://git.code.sf.net/p/fldigi/$pkgname#branch=master"
#	"$pkgname::git://git.code.sf.net/p/fldigi/$pkgname#branch=pu/df"
#	http://www.w1hkj.com/files/test_suite/linsim-2.0.1.tar.gz
	)

#pkgver() {
#	cd $srcdir/$pkgname
#
#	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

prepare() {
	cd $srcdir/$pkgname
#	cd $srcdir/$pkgname-$pkgver

	sed -i -e s:Other:Network: data/linsim.desktop
}

build() {
	cd $srcdir/$pkgname
#	cd $srcdir/$pkgname-$pkgver

	autoreconf --install
	automake --add-missing
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$pkgname
#	cd $srcdir/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
md5sums=('SKIP')
sha256sums=('SKIP')
