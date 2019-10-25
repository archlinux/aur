# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=httpdirfs
pkgver=1.1.10
pkgrel=1
pkgdesc="A filesystem which allows you to mount HTTP directory listings"
arch=('any')
url="https://github.com/fangfufu/httpdirfs"
license=('GPL')
depends=('gumbo-parser' 'fuse2' 'openssl')
makedepends=('gumbo-parser' 'fuse2' 'openssl')
source=("https://github.com/fangfufu/$pkgname/archive/$pkgver.tar.gz")
md5sums=("cfe5321a3de14cade2ce7bcbfcfde018")

prepare() {
	cd "$pkgname-$pkgver"

    # Replace /usr/local prefix with /usr
    sed -i 's/^prefix ?= \/usr\/local/prefix ?= \/usr/' Makefile 
}
build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
