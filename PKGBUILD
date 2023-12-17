# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=pixlet
pkgver=0.29.1
pkgrel=1
pkgdesc='Build apps for pixel-based displays'
arch=('x86_64' 'aarch64')
url='https://github.com/tidbyt/pixlet'
license=('Apache')
depends=('libwebp')
makedepends=('npm' 'go')
source=("https://github.com/tidbyt/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8a96ac31b74263b6ef31ebdfe63b8061fabab5d498b9612b560982810a47d4f3')

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
