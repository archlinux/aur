# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Martin Tournoij <martin@arp242.net>

pkgname=pqiv
pkgver=2.10.4
pkgrel=2
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
sha256sums=('58ddd18748e0b597aa126b7715f54f10b4ef54e7cd02cf64f7b83a23a6f5a14b')

build() {
	cd "$pkgname-$pkgver"
    ./configure --backends=archive,gdkpixbuf
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
