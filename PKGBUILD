# Maintainer: Sam A. Horvath-Hunt <contact at samhh dot com>

_reponame=bukubrow-host
pkgname=bukubrow
pkgver=4.0.1
pkgrel=1
pkgdesc="Host application for the Bukubrow WebExtension"
url="https://github.com/samhh/$_reponame/"
makedepends=('cargo')
arch=('x86_64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samhh/$_reponame/archive/v$pkgver.tar.gz")
md5sums=('7f0990f959ef1440e3b461d4cd3a50ce')

build() {
	cd "$_reponame-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$_reponame-$pkgver"
	install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

