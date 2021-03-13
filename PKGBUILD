# Maintainer: Folke H. 'joru' Gleumes <folke-aur@gleumes.org>
pkgname=kickoff
pkgver=0.4.2
pkgrel=1
pkgdesc="A simple and uncomplicated program launcher for wayland"
makedepends=('cargo' 'cmake' 'freetype2')
arch=('x86_64')
url="https://github.com/j0ru/kickoff"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j0ru/kickoff/archive/v$pkgver.tar.gz")
sha512sums=('3fa3ee1bef1efa458b3416ca34b2af9791f6e3dcf9de350dd3e8a80fcb2797e0ac7adcec296bc3d6d059edfea36d6fc3b40489f78cb5355f448c6e43d9226496')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}


package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
