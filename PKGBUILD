# Maintainer: Rayr https://rayr.ml/LinkInBio/
pkgname=discord-rpc-cli-git
pkgver=1.3.0
pkgrel=1
pkgdesc="A Discord RPC cli client written purely in Rust"
arch=('x86_64')
url="https://github.com/Rayrsn/Discord-RPC-cli"
license=('GPL')
makedepends=('cargo')
source=("https://github.com/Rayrsn/Discord-RPC-cli/archive/refs/tags/V$pkgver.zip")
md5sums=('1c644c878ba327f2421d7cb64ef905ba')
build() {
    cd "Discord-RPC-cli-$pkgver"
    cargo build --release
}

package() {
	cd "Discord-RPC-cli-$pkgver"
	install -Dm755 "target/release/discord-rpc-cli" "$pkgdir/usr/bin/discord-rpc-cli"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
