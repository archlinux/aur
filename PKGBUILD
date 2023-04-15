pkgname=c2rust
pkgurl="https://c2rust.com"
pkgver=v0.17.0
pkgrel=1

arch=("any")
pkgdesc="Migrate C code to Rust"

builddepends=("cargo" "clang" "cmake" "openssl" "python")
depends=("llvm")


package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cargo install --root $pkgdir/usr --version $pkgver c2rust

	# remove dot files from installation dir
	rm "$pkgdir/usr/.crates.toml"
	rm "$pkgdir/usr/.crates2.json"
}
