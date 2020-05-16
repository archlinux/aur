# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=netease-music-tui
pkgver=0.1.2
pkgrel=2
pkgdesc="netease cloud music terminal client by rust"
arch=('x86_64')
url="https://github.com/betta-cyber/netease-music-tui"
license=('MIT')
makedepends=('rust')
provides=('netease-music-tui-bin')
conflicts=('netease-music-tui-bin')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/betta-cyber/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5021c8c9d204b439453a1d3aaacc4802a685988c2cb376d057c48a3dbcc74514')
build() {
	cd ${pkgname}-${pkgver}
	cargo build --release --all-features
	# cargo build --release --all-features --locked
}
package() {
	install -Dm755 ${pkgname}-${pkgver}/target/release/ncmt ${pkgdir}/usr/bin/ncmt
	install -Dm644 ${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
