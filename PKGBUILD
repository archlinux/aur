# Maintainer: Folke H. 'joru' Gleumes <folke-aur@gleumes.org>
pkgname=kickoff
pkgver=0.3.8
pkgrel=1
pkgdesc="A simple and uncomplicated program launcher for wayland"
makedepends=('cargo' 'cmake' 'freetype2')
arch=('x86_64')
url="https://github.com/j0ru/kickoff"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j0ru/kickoff/archive/v$pkgver.tar.gz")
sha512sums=('852b6b69fdb4cfa921bce9c160b30fcc5901ed9dac32107d66a20d3b5e24ae04d609f82c9e114d85e732e4485cddbe7a2de2d648683c1f2967700f40e0c1a87a')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}


package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
