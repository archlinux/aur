# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=1.4.5
pkgrel=2
pkgdesc="Amateur (Ham) Radio Transceiver Control Program"
arch=('armv7h' 'i686' 'x86_64' 'aarch64')
url="http://www.w1hkj.com/flrig-help/index.html"
license=('GPL')
depends=('fltk' 'systemd-libs' 'flxmlrpc>=1.0.1' 'hamradio-menus')
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
md5sums=('598f41990457ba390e998b188e570388')
sha256sums=('663fcb90fd674a6d732ca2f1b867da2ae56e3fc8da565bcafd3cd7e74e152879')
