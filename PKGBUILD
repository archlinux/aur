# shellcheck disable=SC2148
# shellcheck disable=SC2034

# Maintainer: juanvel400 <juanvel400@proton.me>
pkgname=n191
pkgver=1.0.0
pkgrel=1
pkgdesc="A Microsoft Edit fork"
arch=('x86_64')
url="https://github.com/juanvel4000/n191"
license=('MIT')
makedepends=('rust' 'rust-src')
source=("https://github.com/juanvel4000/n191/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aea2d123cc0decdf5ae5b53358ba91b793c7baafdda6201dc8f2ff2aca389a0e')



build() {
	cd "$pkgname-$pkgver"
	RUSTC_BOOTSTRAP=1 cargo build --config .cargo/release.toml --release
}


package() {
	cd "$pkgname-$pkgver"
    install -Dm755 target/release/n191 "$pkgdir/usr/bin/n191"

}