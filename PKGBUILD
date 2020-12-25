# Maintainer: Folke H. 'joru' Gleumes <folke-aur@gleumes.org>
pkgname=kickoff
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple and uncomplicated program launcher for wayland"
makedepends=('cargo' 'cmake' 'freetype2')
arch=('x86_64')
url="https://github.com/j0ru/kickoff"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j0ru/kickoff/archive/v$pkgver.tar.gz")
sha512sums=('8173c6fc62ec3fbce28508cb5d4f7f0db3da6af6b26adb1b76e3c94b0e401bffd4587459a135fed7061fe91c7f21ad1875f6b533b49f546b124b79df4a28a069')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}


package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
