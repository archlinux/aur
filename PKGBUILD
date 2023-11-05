# Maintainer: spider-mario <spidermario@free.fr>
pkgname=ssimulacra
pkgver=0.2
pkgrel=3
pkgdesc="Structural SIMilarity Unveiling Local And Compression Related Artifacts"
arch=('x86_64')
url="https://github.com/cloudinary/ssimulacra"
license=('Apache')
depends=('opencv')
makedepends=('boost' 'git')
source=('git+https://github.com/cloudinary/ssimulacra.git#commit=375726b13f9dec2a01950e6710e7e9f488c52ea3'
        'opencv4.patch')
sha512sums=('SKIP'
            '3d08d467c71b1bb64ad232a530fb970467c76ac745d7bd75f6df3c8823bf9a54448b98287098cec6076e80093b745b9f26e085048ed49afe7998c0254de3c77b')

prepare() {
	cd "$pkgname"
	git apply --3way "$srcdir"/opencv4.patch
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm755 ssimulacra "$pkgdir"/usr/bin/ssimulacra
}
