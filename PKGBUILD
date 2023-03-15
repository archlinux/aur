# Maintainer: Hanh Huynh Huu <hanh425 at gmail dot com>
pkgname=ywallet-bin
pkgver=1.3.5
pkgrel=398
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
sha256sums=('69d28179d6dc7706737aa2fe122e0f55865c8e936ef5c7901193f706c3fc498f'
            '9ad22794ab965be36abb1bfb2a885c2d7cde3340bc0a3cbbc014f94376eba612')

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
