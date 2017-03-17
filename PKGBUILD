# Maintainer: Jelle van der Waa <jelle@archlinux.org>
pkgname=guetzli
pkgver=1.0
pkgrel=1
pkgdesc="Perceptual JPEG encoder"
arch=(x86_64 i686)
url="https://github.com/google/guetzli"
license=('APL')
depends=('gflags' 'libpng')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/guetzli/archive/v1.0.tar.gz")
sha512sums=('da34259134df70407dabc530c6b78c3327b46b88480e42c6c002ba65c6cd527fdaffada50e40c369d46c9bcf14576b449275d151dbe4c164ae87d996a179ce45')

build() {
	cd "$pkgname-$pkgver"
	make config=release
}

package() {
	cd "$pkgname-$pkgver"
        install -d "$pkgdir/usr/bin/"
        install -Dm755 bin/Release/guetzli "$pkgdir/usr/bin/"
}
