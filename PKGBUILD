
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=discord-rpc-api
pkgver=3.3.0
pkgrel=1
pkgdesc="Libraries for Discord Rich Presence"
arch=("x86_64")
url="https://github.com/discordapp/discord-rpc"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz"::'https://github.com/discordapp/discord-rpc/archive/v3.3.0.tar.gz')
md5sums=('6f8c49413a2b91c443d812f4bae39938')
sha256sums=('1c625f3546761e778e084fe037540f4fdb5452e9c297ee790bbb43ce3cf955b5')

build() {
	cd "discord-rpc-$pkgver"
	mkdir -p build
	cd build
}

package() {
	cd $pkgdir
	mkdir usr
	cd usr
	mkdir lib
	ln -s ./lib lib64
	cd "$srcdir/discord-rpc-$pkgver/build"
	make install DESTDIR=$pkgdir
	rm $pkgdir/usr/lib64
}
