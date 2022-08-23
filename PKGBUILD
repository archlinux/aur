# Maintainer: Rayr https://rayr.ml/LinkInBio/
pkgname=discord-rpc-cli
pkgver=1.4.1
pkgrel=2
pkgdesc="A Discord RPC cli client written purely in Rust"
arch=('x86_64')
url="https://github.com/Rayrsn/Discord-RPC-cli"
license=('GPL')
makedepends=('cargo')
source=("https://github.com/Rayrsn/Discord-RPC-cli/archive/refs/tags/V$pkgver.zip")
md5sums=('3ddc7d25ca8bfb88ad5f3de8383ace61')
build() {
    cd "Discord-RPC-cli-$pkgver"
    cargo build --release
}

package() {
	cd "Discord-RPC-cli-$pkgver"
	install -Dm755 "target/release/discord-rpc-cli" "$pkgdir/usr/bin/discord-rpc-cli"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
