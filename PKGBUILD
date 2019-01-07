# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Martin Tournoij <martin@arp242.net>

pkgname=pqiv
pkgver=2.11
pkgrel=1
pkgdesc="Modern rewrite of Quick Image Viewer"
arch=('i686' 'x86_64')
url="https://github.com/phillipberndt/$pkgname/"
license=('GPL3')
depends=('gtk3' 'libarchive>=3.3.2')
optdepends=('libspectre: PS/EPS support'
            'poppler: PDF support'
            'libwebp: WebP support'
            'imagemagick: additional image formats like PSD'
)
source=("https://github.com/phillipberndt/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ea1f8b6bcb58dee19e2d8168ef4efd01e222c653eabbd3109aad57a870cc8c9b')

build() {
	cd "$pkgname-$pkgver"
    ./configure --backends=archive,gdkpixbuf
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
