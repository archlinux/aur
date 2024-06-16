# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=pixlet
pkgver=0.33.4
pkgrel=1
pkgdesc='Build apps for pixel-based displays'
arch=('x86_64' 'aarch64')
url='https://github.com/tidbyt/pixlet'
license=('Apache')
depends=('libwebp')
makedepends=('npm' 'go')
source=("https://github.com/tidbyt/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('47e07cd0d4470deeeb59b393df8a6a0773e458ac3ae9aeaba3b3187cbb0ab6df')

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
