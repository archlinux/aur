# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=netease-music-tui
pkgver=0.1.1
pkgrel=1
pkgdesc="netease cloud music terminal client by rust"
arch=('x86_64')
url="https://github.com/betta-cyber/netease-music-tui"
license=('MIT')
makedepends=('rust')
provides=('netease-music-tui-bin')
conflicts=('netease-music-tui-bin')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/betta-cyber/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('53a35bfdc9e69a4cfeb154eb082b7fe7af9a79ac32049a19d6536938d7114597')
build() {
	cd ${pkgname}-${pkgver}
	cargo build --release
}
package() {
	install -Dm755 ${pkgname}-${pkgver}/target/release/ncmt ${pkgdir}/usr/bin/ncmt
	install -Dm644 ${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
