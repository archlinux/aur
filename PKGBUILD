# Maintainer: Hanh Huynh Huu <hanh425 at gmail dot com>
pkgname=ywallet-bin
pkgver=1.14.0
pkgrel=429
pkgdesc='Ycash/Zcash wallet'
arch=('x86_64')
url='https://ywallet.app'
license=('MIT')
groups=()
depends=('gtk3' 'gst-plugins-base-libs')
source=(zwallet.tgz::https://github.com/hhanh00/zwallet/releases/download/v${pkgver}/zwallet.tgz
	    libwarp_api_ffi.so::https://github.com/hhanh00/zwallet/releases/download/v${pkgver}/libwarp_api_ffi.so)
noextract=('zwallet.tgz')
sha256sums=('bed5766b13a1de95babdf1f3fbc15507c4c9bd8c1caeb04a222fbef9e8be54e7'
            'eb9d3c7ae99082290d11bdc2e704f13840c9e92c8ee7e9010404f3037a0c6886')

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
