# Maintainer: KingofToasters <s.gregoratto@gmail.com>

pkgname=otpclient
_dirname=OTPClient
pkgver=1.0.6
pkgrel=1
pkgdesc="Simple GTK+ v3 TOTP/HOTP client that uses libcotp"
arch=('x86_64')
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
depends=('gtk3' 'glib2' 'json-glib' 'libgcrypt' 'json-glib' 'libzip' 'libcotp' 'pkg-config')
makedepends=('cmake' 'git')
provides=(otpclient)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('1f213de12d09c512944a2d13550e9e2439cbe638302b7eb54c75f93bb3451e07')

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
