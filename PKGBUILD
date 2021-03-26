# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

_reponame=bukubrow-host
pkgname=bukubrow
pkgver=5.2.0
pkgrel=1
pkgdesc="Host application for the Bukubrow WebExtension"
url="https://github.com/samhh/$_reponame/"
makedepends=('cargo')
arch=('x86_64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samhh/$_reponame/archive/v$pkgver.tar.gz")
sha256sums=('ab7f3a6cade0875e34c8962f6a6c3af138e607cb95e1d2cf58dba58075bc5d81')

build() {
	cd "$_reponame-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$_reponame-$pkgver"
	install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

