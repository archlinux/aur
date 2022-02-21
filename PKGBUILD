# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=1.4.4
pkgrel=2
pkgdesc="Amateur (Ham) Radio Transceiver Control Program"
arch=('armv7h' 'i686' 'x86_64')
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
md5sums=('f71be12af0b55489d584a16d28f64491')
sha256sums=('01331d55aac3fdfa550f905b51a483175ac439b6169bafc393a84c124232743a')
