# Maintainer: Rayr https://rayr.ml/LinkInBio/
pkgname=discord-rpc-cli
pkgver=1.4.5
pkgrel=1
pkgdesc="A Discord RPC cli client written purely in Rust"
arch=('x86_64')
url="https://github.com/Rayrsn/Discord-RPC-cli"
license=('GPL')
makedepends=('cargo')
source=("https://github.com/Rayrsn/Discord-RPC-cli/archive/refs/tags/V$pkgver.zip")
md5sums=('0afa123982c2bf0b8a8da7cdc1f411d0')
build() {
    cd "Discord-RPC-cli-$pkgver"
    cargo build --release
}

package() {
	cd "Discord-RPC-cli-$pkgver"
	install -Dm755 "target/release/discord-rpc-cli" "$pkgdir/usr/bin/discord-rpc-cli"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
