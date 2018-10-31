# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=otpclient
pkgver=1.3.1
pkgrel=1
pkgdesc="A simple GTK+ v3 TOTP/HOTP client"
arch=('x86_64')
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
depends=('gtk3>=3.22' 'glib2>=2.50' 'jansson' 'libgcrypt' 'libzip' 'libcotp' 'libpng' 'zbar>=0.20')
makedepends=('cmake' 'git')
conflicts=(otpclient)
source=("$url/archive/v$pkgver.tar.gz" 
	"$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('7fbf8e1c182a723af0fe9869735c787eb526c1f380500d0c248ef775d1eaec11'
            'SKIP')
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')

build() {
	cd "$srcdir/OTPClient-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
	make
}

package() {
	cd "$srcdir/OTPClient-$pkgver"
	make DESTDIR="$pkgdir/" install
}
