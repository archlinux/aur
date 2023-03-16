# Maintainer: Hanh Huynh Huu <hanh425 at gmail dot com>
pkgname=ywallet-bin
pkgver=1.3.6
pkgrel=421
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
sha256sums=('9ff37f578424ccc33dc2e15c520efdbc9e0543a2c361ce634fae758c14ceb60a'
            '27fe3b3870473317da374ece00eca1972e5f4bd9af459b541ce2de6016182732')

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
