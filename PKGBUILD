# Maintainer: Hanh Huynh Huu <hanh425 at gmail dot com>
pkgname=ywallet-bin
pkgver=1.3.6
pkgrel=427
pkgdesc='Ycash/Zcash wallet'
arch=('x86_64')
url='https://ywallet.app'
license=('MIT')
groups=()
depends=('gtk3' 'gst-plugins-base-libs')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(zwallet.tgz::https://github.com/hhanh00/zwallet/releases/download/v${pkgver}%2B${pkgrel}/zwallet.tgz
	    libwarp_api_ffi.so::https://github.com/hhanh00/zwallet/releases/download/v${pkgver}%2B${pkgrel}/libwarp_api_ffi.so)
noextract=('zwallet.tgz')
sha256sums=('3626cfc8a621a8c18f3b66538c0ef5ba859b5d7cc02f369df0804da7bd288c54'
            '647f1e1e6893bfa5dc8f02ec733882b67a6534fc342d2b8dc3245661f035e62c')

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
