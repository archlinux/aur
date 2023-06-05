# Manitainer: grgergo <csakbek@freemail.hu>

pkgname='siag'
pkgver=3.6.1
pkgrel=1
pkgdesc='A tightly integrated, free office package'
arch=('x86_64')
url='https://siag.nu'
license=('GPL3')
depends=('xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'gmp' 'tcl' 'libxpm' 'nextaw' 'mowitz')

source=("$pkgname-$pkgver.tar.gz::https://siag.nu/pub/siag/siag-3.6.1.tar.gz"
        'siag.patch')
sha256sums=('712633adac591bc48466b12b9012ff51066233b36d0589bc44ed54ba62bcdd5a'
            'b69c894240c4fc12a3edd2eda5a1a69c18ddb61e50a30379e27fcc71fca67b84')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < ../siag.patch
}

build() {
	cd "$pkgname-$pkgver"
	./configure
	make 
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
