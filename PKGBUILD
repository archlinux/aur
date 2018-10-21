# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=otpclient
_dirname=OTPClient
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple GTK+ v3 TOTP/HOTP client"
arch=('x86_64')
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
depends=('gtk3' 'glib2' 'jansson' 'libgcrypt' 'libzip' 'libcotp' 'libpng' 'zbar')
makedepends=('cmake' 'git')
conflicts=(otpclient)
source=("$url/archive/v$pkgver.tar.gz" 
"$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('01cd20cdecec778a54c670e5e1b39cdcee2316a074f1b96ba24cbf0c13355045'
            'SKIP')
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')

build() {
	cmake "$_dirname-$pkgver" -DCMAKE_INSTALL_PREFIX:PATH=/usr
	make
}

package() {
	make DESTDIR="$pkgdir/" install
}
