# Maintainer: Wouter de Vries <archlinux@wouter.dev>
pkgname=libwandio
_pkgname=wandio
pkgver=4.2.6
pkgrel=1
pkgdesc="software library written in C that provides an API for transparently reading from and writing to files using a variety of supported compression methods"
url="http://research.wand.net.nz/software/libwandio.php"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('zlib' 'curl>=7.18.0')
source=("https://github.com/LibtraceTeam/wandio/archive/refs/tags/$pkgver-$pkgrel.tar.gz")
sha256sums=('f035d4d6beadf7a7e5619fb73db5a84d338008b5f4d6b1b8843619547248ec73')

build() {
	cd "$_pkgname-$pkgver-$pkgrel"
	./bootstrap.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver-$pkgrel"
	make DESTDIR="$pkgdir/" install
}
