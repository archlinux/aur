# Maintainer: KingofToasters <themanhimself@sgregoratto.me>

pkgname=otpclient
_dirname=OTPClient
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple GTK+ v3 TOTP/HOTP client that uses libcotp"
arch=('x86_64')
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
depends=('gtk3' 'glib2' 'jansson' 'libgcrypt' 'libzip' 'libcotp' 'pkg-config')
makedepends=('cmake' 'git')
conflicts=(otpclient)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('cf93aa21db03e821bd987e4471e1f35fae5c846cc8482249c589ba51969cdc30')

build() {
	cd $_dirname-$pkgver
	mkdir build 
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd $_dirname-$pkgver/build
	make DESTDIR="$pkgdir/" install
}
