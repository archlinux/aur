# Maintainer: Nox04 <contact@juanangarita.com>
pkgname=crypto-tracker
pkgver=0.1.7
pkgrel=1
pkgdesc="This program allows you to track the value of multiple cryptocurrencies and output a JSON object that you can use in Waybar or similar programs."
arch=('x86_64')
url="https://github.com/Nox04/crypto-tracker"
license=('MIT')
makedepends=('go' 'git')
provides=(crypto-tracker)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nox04/crypto-tracker/archive/v$pkgver.tar.gz")
sha512sums=('26258700854bdacc1fed5d20c1fee732e8474bc703a966c07bda0173181441c5c7e9ae962921e7993d2127dc5fd094c87b0c3058a14fa3bc10d27ad4aee32953')

build() {
	cd "$pkgname-$pkgver"
	go build -o crypto-tracker -ldflags "-s -w"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ${pkgname} -t "$pkgdir/usr/bin/"
}
