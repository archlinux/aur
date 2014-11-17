# Maintainer: Johannes Dewender	arch at JonnyJD dot net
pkgname=image-id
pkgver=2.1.0
pkgrel=1
pkgdesc="A tool to compute the MusicBrainz disc ID from a CD image"
arch=('x86_64' 'i686')
url="https://github.com/kepstin/image-id"
license=('GPL2')
depends=('libdiscid' 'libmirage>=2.1.0')
options=()
source=(https://github.com/kepstin/image-id/releases/download/v$pkgver/$pkgname-${pkgver}.tar.gz)
sha256sums=('9ae16f4a938d351df5468e8d0ba732fde648dc4f1a1212e05d79ab312f8d7947')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
