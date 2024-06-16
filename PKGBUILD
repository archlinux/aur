# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=pixlet
pkgver=0.33.3
pkgrel=1
pkgdesc='Build apps for pixel-based displays'
arch=('x86_64' 'aarch64')
url='https://github.com/tidbyt/pixlet'
license=('Apache')
depends=('libwebp')
makedepends=('npm' 'go')
source=("https://github.com/tidbyt/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d53e35da244787850070873ea8c7933aca1eac44ccd99b4cc70158382bd91e0d')

build () {
	cd "$pkgname-$pkgver"
	npm install
	npm run build
	make build
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm755 pixlet "$pkgdir"/usr/bin/pixlet
}
