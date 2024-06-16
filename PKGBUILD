# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=pixlet
pkgver=0.33.5
pkgrel=1
pkgdesc='Build apps for pixel-based displays'
arch=('x86_64' 'aarch64')
url='https://github.com/tidbyt/pixlet'
license=('Apache')
depends=('libwebp')
makedepends=('npm' 'go')
source=("https://github.com/tidbyt/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('80a3acf956e301e3a02ae37e4ee2ef5eb6750e4531f050d02a8dbffc6f2f1d5a')

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
