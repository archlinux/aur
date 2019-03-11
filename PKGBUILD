# Maintainer: spider-mario <spidermario@free.fr>
pkgname=ssimulacra
pkgver=0.1
pkgrel=2
pkgdesc="Structural SIMilarity Unveiling Local And Compression Related Artifacts"
arch=('x86_64')
url="https://github.com/cloudinary/ssimulacra"
license=('Apache')
depends=('opencv2')
makedepends=('vtk')
source=('git+https://github.com/cloudinary/ssimulacra.git#commit=589fac281aa4a8ecfb9ce07ec2e6f6dd1e6eccbb')
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
