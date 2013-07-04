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
md5sums=('86155dbcf8c2b7ac5df8cb242196b9ea')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make CFLAGS="${CFLAGS} -Wall" LDFLAGS="${LDFLAGS}"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D image_id $pkgdir/usr/bin/image_id
}
