# Maintainer: Folke H. 'joru' Gleumes <folke-aur@gleumes.org>
pkgname=kickoff
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple and uncomplicated program launcher for wayland"
makedepends=('cargo' 'cmake' 'freetype2')
arch=('x86_64')
url="https://github.com/j0ru/kickoff"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j0ru/kickoff/archive/v$pkgver.tar.gz")
sha512sums=('b78679353fede32df0735d2b4e445648ce7798779b424a807bacd62af4a3418df913888db3bb0eb07978c2a113420f887be8f30eb20787ec16dfd05a9b68c9c5')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}


package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
