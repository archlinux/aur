# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

_reponame=bukubrow-host
pkgname=bukubrow
pkgver=5.3.0
pkgrel=1
pkgdesc="Host application for the Bukubrow WebExtension"
url="https://github.com/samhh/$_reponame/"
conflicts=('bukubrow-bin')
makedepends=('cargo')
arch=('x86_64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samhh/$_reponame/archive/v$pkgver.tar.gz")
sha256sums=('8665f2ac88c72115ceaa95161bc8ada2763e8429f2231b46db2f1148c90164ae')

build() {
	cd "$_reponame-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$_reponame-$pkgver"
	install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

