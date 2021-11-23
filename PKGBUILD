# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

_reponame=bukubrow-host
pkgname=bukubrow
pkgver=5.4.0
pkgrel=1
pkgdesc="Host application for the Bukubrow WebExtension"
url="https://github.com/samhh/$_reponame/"
provides=('bukubrow')
makedepends=('cargo')
arch=('x86_64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samhh/$_reponame/archive/v$pkgver.tar.gz")
sha256sums=('096cc79c994d56abf6400128f2b8d01f8d1e316e5b0c52086eb955e7583c6075')

build() {
	cd "$_reponame-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$_reponame-$pkgver"
	install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

