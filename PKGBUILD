# Maintainer: spider-mario <spidermario@free.fr>
pkgname=ssimulacra
pkgver=0.2
pkgrel=1
pkgdesc="Structural SIMilarity Unveiling Local And Compression Related Artifacts"
arch=('x86_64')
url="https://github.com/cloudinary/ssimulacra"
license=('Apache')
depends=('opencv2' 'boost-libs')
makedepends=('boost')
source=('git+https://github.com/cloudinary/ssimulacra.git#commit=4c92d4184a8917fecdecccb68a8231cdfbc24249')
sha512sums=('SKIP')

prepare() {
	cd "$pkgname"
	perl -pe 's/(?:C|LD)FLAGS\K=/+=/g; s/ -lopencv_imgcodecs//' -i Makefile
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm755 ssimulacra "$pkgdir"/usr/bin/ssimulacra
}
