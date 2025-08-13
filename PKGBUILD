# Maintainer: Hanh Huynh Huu <hanh425 at gmail dot com>
pkgname=ywallet-bin
pkgver=1.13.4
pkgrel=428
pkgdesc='Ycash/Zcash wallet'
arch=('x86_64')
url='https://ywallet.app'
license=('MIT')
groups=()
depends=('gtk3' 'gst-plugins-base-libs')
source=(zwallet.tgz::https://github.com/hhanh00/zwallet/releases/download/v${pkgver}/zwallet.tgz
	    libwarp_api_ffi.so::https://github.com/hhanh00/zwallet/releases/download/v${pkgver}/libwarp_api_ffi.so)
noextract=('zwallet.tgz')
sha256sums=('407917968f0224345b97067b9bfe7d3d306d48b8402c6e2ed5e9820926782fb4'
            '59a4caa43b5bcaba92dd86eaa120b910b660c6ae11c995a5eb724d08f3c8fed3')

prepare() {
	mkdir -p ywallet
	tar xv -f zwallet.tgz -C ywallet
}

build() {
	cp libwarp_api_ffi.so ywallet/lib
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp -ra $srcdir/ywallet/* $pkgdir/usr/bin
}
