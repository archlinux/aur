# Maintainer: Hagarashi <hagarashi@proton.me>
pkgname='lrcfetch-git'
pkgver='v0.0.1'
pkgrel=1
pkgdesc='Tool to fetch lyrics from LRCLIB'
arch=('x86_64')
url="https://github.com/hagaraShin/lrcfetch-tui"
license=('MIT')
depends=(glibc gcc-libs openssl)
makedepends=(git rust)
provides=('lrcfetch')
conflicts=(lrcfetch-bin)
source=("git+https://github.com/hagaraShin/lrcfetch-tui.git")
sha256sums=('SKIP')

build() {
	cd "lrcfetch-tui"
	cargo build --release
}

package() {
	cd "lrcfetch-tui"
	install -Dm644 ./LICENSE -t "${pkgdir}/usr/share/licenses/lrcfetch/LICENSE"
	install -Dm755 ./target/release/lrcfetch -t "$pkgdir/usr/bin"
}
