# Maintainer: Isabel <isabel@isabelroses.com>
pkgname=bellado-git
_pkgname=bellado
pkgver=1.2.0
pkgrel=1
pkgdesc="A fast and once simple cli todo tool"
arch=('x86_64')
url="https://github.com/isabelroses/bellado"
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
	install -Dm755 "target/release/bellado" "$pkgdir/usr/bin/bellado"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
