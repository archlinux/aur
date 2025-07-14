# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=2.0.08
pkgrel=1
pkgdesc="Amateur (Ham) Radio Transceiver Control Program"
arch=('armv7h' 'i686' 'x86_64' 'aarch64')
url="http://www.w1hkj.com/flrig-help/index.html"
license=('GPL-2.0-or-later')
depends=('fltk<1.5' 'systemd-libs' 'flxmlrpc>=1.0.1' 'hamradio-menus')
optdepends=('fldigi: for digital mode interface')
makedepends=('autoconf' 'automake' 'pkg-config')
provides=('flrig')
conflicts=('flrig-git')
source=(https://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	autoreconf -i
}

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr
}

check() {
	cd $srcdir/$pkgname-$pkgver

	make -k check
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
md5sums=('759c2099c04f0a758061da029b390d4e')
sha256sums=('f9eaf140164a1f330e40f33f54093e230f48b4f6675bd35d8aed07434f12ce6f')
