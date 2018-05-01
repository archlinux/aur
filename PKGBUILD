# Maintainer: KingofToasters <themanhimself@sgregoratto.me>

pkgname=otpclient
_dirname=OTPClient
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple GTK+ v3 TOTP/HOTP client that uses libcotp"
arch=('x86_64')
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
depends=('gtk3' 'glib2' 'jansson' 'libgcrypt' 'libzip' 'libcotp' 'pkg-config' 'libpng' 'zbar')
makedepends=('cmake' 'git')
conflicts=(otpclient)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('cb7b04d9e38d6ecbc8f1cbaa4c7d319869d68a9d7c76122645d249ec3899c048')

build() {
	cmake "$_dirname-$pkgver" -DCMAKE_INSTALL_PREFIX:PATH=/usr
	make
}

package() {
	make DESTDIR="$pkgdir/" install
}
