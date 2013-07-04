# Maintainer: Johannes Dewender	arch at JonnyJD dot net
pkgname=image-id
pkgver=master
pkgrel=1
pkgdesc="A tool to compute the MusicBrainz disc ID from a CD image"
arch=('x86_64' 'i686')
url="https://github.com/kepstin/image-id"
license=('GPL2')
groups=()
depends=('libdiscid' 'libmirage>=2.0.0')
makedepends=()
options=()
source=($pkgname-$pkgver.zip::https://github.com/kepstin/image-id/archive/master.zip)
md5sums=('af5b62a60bf7015b36b670527a92d019')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i -e 's/CFLAGS=-g/CFLAGS += -g/' Makefile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D image_id $pkgdir/usr/bin/image_id
}
