# Maintainer: Isabel <isabelroseslive@gmail.com>
pkgname=bellsym-git
_pkgname=bellsym
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple command line tool to move all config files from a directory to another, and create symbolic links where needed."
arch=('x86_64')
url="https://github.com/isabelroses/bellsym"
license=('MIT')
depends=()
makedepends=('git' 'cargo')
source=("$pkgname::git+$url")
md5sums=('SKIP')

build() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/bellsym" "$pkgdir/usr/bin/bellsym"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
