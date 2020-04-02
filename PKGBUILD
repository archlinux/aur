# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Martin Tournoij <martin@arp242.net>

pkgname=pqiv
pkgver=2.11
pkgrel=2
pkgdesc='Modern rewrite of Quick Image Viewer'
arch=('x86_64' 'i686')
url="https://github.com/phillipberndt/$pkgname"
license=('GPL3')
depends=('ffmpeg'
         'gtk3'
         'imagemagick'
         'libarchive'
         'libspectre'
         'libwebp'
         'poppler-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ea1f8b6bcb58dee19e2d8168ef4efd01e222c653eabbd3109aad57a870cc8c9b')

build() {
	cd "$pkgname-$pkgver"
    ./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
