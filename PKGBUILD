# Maintainer: DrRac27 <drrac27 at riseup dot net>

pkgname=vanity-monero-bin
pkgver=v0.2.7
pkgrel=1
pkgdesc="Generates vanity address for CryptoNote currencies. Currently only Monero main net and test net are supported."
arch=("x86_64" "i686")
url="https://github.com/Equim-chan/vanity-monero"
license=("MIT")
provides=("vanity-monero=$pkgver")
source_x86_64=("https://github.com/Equim-chan/vanity-monero/releases/download/${pkgver}/vanity-monero-linux-64.tar.xz")
source_i686=("https://github.com/Equim-chan/vanity-monero/releases/download/${pkgver}/vanity-monero-linux-32.tar.xz")
sha256sums_x86_64=("8e713e6f9fa1e77c6fcc969542af6a3682e43d70236de967220dce0d076814d2")
sha256sums_i686=("de40cdbecf4f33a5bac69e724f1eaba6902f5d2f8da47e5a08fca0029498b643")

prepare() {
	tar xf vanity-monero-linux-*.tar.xz
}

package() {
	install -Dm 755 vanity-monero "$pkgdir/usr/bin/vanity-monero"
	install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/vanity-monero/LICENSE"
}
