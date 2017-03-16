# Maintainer: Your Name <youremail@domain.com>
pkgname=guetzli
pkgver=1.0
pkgrel=1
pkgdesc="Perceptual JPEG encoder"
arch=(x86_64 i686)
url="https://github.com/google/guetzli"
license=('APL')
depends=('gflags' 'libpng')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/guetzli/archive/v1.0.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	make config=release
}

package() {
	cd "$pkgname-$pkgver"
        install -d $pkgdir/usr/bin/
        install -Dm755 bin/Release/guetzli $pkgdir/usr/bin/
}
md5sums=('6d0af1f00cb4b319d589d33f8f4e2520')
