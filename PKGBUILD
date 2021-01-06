# Maintainer: Folke H. 'joru' Gleumes <folke-aur@gleumes.org>
pkgname=kickoff
pkgver=0.3.5
pkgrel=1
pkgdesc="A simple and uncomplicated program launcher for wayland"
makedepends=('cargo' 'cmake' 'freetype2')
arch=('x86_64')
url="https://github.com/j0ru/kickoff"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j0ru/kickoff/archive/v$pkgver.tar.gz")
sha512sums=('08660f4f0c9903e96e1a1734358f89229bbf43393be0783658488cf141b1366b4f61d37d7c3e5fdceeaa0c66c80583fe7465a5f5e77c100c85d718b50821fe8a')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}


package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
