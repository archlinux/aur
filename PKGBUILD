# Maintainer: grtcdr <ba.tahaaziz@gmail.com>

pkgname=macchina
pkgver=5.0.2
pkgrel=1
pkgdesc="A system information fetcher, with an (unhealthy) emphasis on performance."

arch=('x86_64')
url="https://github.com/Macchina-CLI/macchina"
license=('MIT')

depends=('gcc-libs' 'glibc')
optdepends=('wmctrl: window manager support')
makedepends=('rust' 'cargo' 'git')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('418c0e15d1d3fd58fa14fc2f13695d2896092104fa9fd625ecc8bd2dc9055e2d')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
   install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
   install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
