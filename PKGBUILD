# Maintainer: Johannes Dewender	arch at JonnyJD dot net
pkgname=image-id
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool to compute the MusicBrainz disc ID from a CD image"
arch=('x86_64' 'i686')
url="https://github.com/kepstin/image-id"
license=('GPL2')
groups=()
depends=('libdiscid' 'libmirage>=2.0.0')
makedepends=()
options=()
source=(https://github.com/kepstin/image-id/releases/download/v$pkgver/$pkgname-${pkgver}.tar.gz)
md5sums=('c805ad7e59d2d8bbcde867f7a65a8f05')

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
