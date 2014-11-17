# Maintainer: Johannes Dewender	arch at JonnyJD dot net
pkgname=image-id
pkgver=2.0.0
pkgrel=1
pkgdesc="A tool to compute the MusicBrainz disc ID from a CD image"
arch=('x86_64' 'i686')
url="https://github.com/kepstin/image-id"
license=('GPL2')
groups=()
depends=('libdiscid' 'libmirage>=3.0.0')
makedepends=()
options=()
source=(https://github.com/kepstin/image-id/releases/download/v$pkgver/$pkgname-${pkgver}.tar.gz)
sha256sums=('63164c26689c5b48d8f6621d08f1e0f45e8ac6107faba95ab8818b0fc66f6d77')

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
