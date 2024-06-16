# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=pixlet
pkgver=0.34.0
pkgrel=1
pkgdesc='Build apps for pixel-based displays'
arch=('x86_64' 'aarch64')
url='https://github.com/tidbyt/pixlet'
license=('Apache')
depends=('libwebp')
makedepends=('npm' 'go')
source=("https://github.com/tidbyt/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8eaa3b3e252c16e0cf1bb1ede7f07c5a0a2c4e0f5ab3bad859ed7876b6fdc413')

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
