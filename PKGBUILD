# Maintainer: Nox04 <contact@juanangarita.com>
pkgname=crypto-tracker
pkgver=0.1.6
pkgrel=1
pkgdesc="This program allows you to track the value of multiple cryptocurrencies and output a JSON object that you can use in Waybar or similar programs."
arch=('x86_64')
url="https://github.com/Nox04/crypto-tracker"
license=('MIT')
makedepends=('go' 'git')
provides=(crypto-tracker)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nox04/crypto-tracker/archive/v$pkgver.tar.gz")
sha512sums=('bd2b9d33079a92dddb67e1d3902a7b3a659321287f65bc188725d5e44d09895cbf5ec21c1fd329123061fd3462afed45a826f84b27e885d4d9661d18c2a84f8b')

build() {
	cd "$pkgname-$pkgver"
	go build -o crypto-tracker -ldflags "-s -w"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ${pkgname} -t "$pkgdir/usr/bin/"
}
