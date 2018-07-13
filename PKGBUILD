# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=otpclient
_dirname=OTPClient
pkgver=1.2.2
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
sha256sums=('d4cadcb6f9c11280969dce8629886a87813211ecbce231a9b868b7a47f7e923d'
            'SKIP')
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')

build() {
	cmake "$_dirname-$pkgver" -DCMAKE_INSTALL_PREFIX:PATH=/usr
	make
}

package() {
	make DESTDIR="$pkgdir/" install
}
