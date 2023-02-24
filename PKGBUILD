# Maintainer: Nox04 <contact@juanangarita.com>
pkgname=crypto-tracker
pkgver=0.1.5
pkgrel=1
pkgdesc="This program allows you to track the value of multiple cryptocurrencies and output a JSON object that you can use in Waybar or similar programs."
arch=('x86_64')
url="https://github.com/Nox04/crypto-tracker"
license=('MIT')
makedepends=('go' 'git')
provides=(crypto-tracker)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nox04/crypto-tracker/archive/v$pkgver.tar.gz")
sha512sums=('07106c167ffda5fe356a5467b2c94de54b8d291c68899fa142d7831af9a1d44eb1e2cf11a411efc4affe71bffc12f9d98abe69f1408abf9fd2f8afbfb2ca6546')

build() {
	cd "$pkgname-$pkgver"
	go build -o crypto-tracker -ldflags "-s -w"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ${pkgname} -t "$pkgdir/usr/bin/"
}
