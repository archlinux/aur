# Maintainer: Nox04 <contact@juanangarita.com>
pkgname=crypto-tracker
pkgver=0.1.8
pkgrel=1
pkgdesc="This program allows you to track the value of multiple cryptocurrencies and output a JSON object that you can use in Waybar or similar programs."
arch=('x86_64')
url="https://github.com/Nox04/crypto-tracker"
license=('MIT')
makedepends=('go' 'git')
provides=(crypto-tracker)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nox04/crypto-tracker/archive/v$pkgver.tar.gz")
sha512sums=('cbd5d72b9f3e01d3469242e5ef1190c7161a73c46fec0dfb0dce2902b0f49c664ae4422a7a7f2430dd8582dd4681a5f5c59dabacbb596431540659bfec4ecb6d')

build() {
	cd "$pkgname-$pkgver"
	go build -o crypto-tracker -ldflags "-s -w"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ${pkgname} -t "$pkgdir/usr/bin/"
}
