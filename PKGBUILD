# Maintainer: spider-mario <spidermario@free.fr>
pkgname=ssimulacra
pkgver=0.1
pkgrel=1
pkgdesc="Structural SIMilarity Unveiling Local And Compression Related Artifacts"
arch=('x86_64')
url="https://github.com/cloudinary/ssimulacra"
license=('Apache')
depends=('opencv')
makedepends=('vtk')
source=('git+https://github.com/cloudinary/ssimulacra.git')
sha512sums=('SKIP')

prepare() {
	cd "$pkgname"
	perl -pe 's/(?:C|LD)FLAGS\K=/+=/g' -i Makefile
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm755 ssimulacra "$pkgdir"/usr/bin/ssimulacra
}
