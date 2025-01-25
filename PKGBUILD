# Maintainer: Tim Paik <timpaik@163.com>
pkgname=rhai-tools
_pkgname=rhai
pkgver=1.21.0
pkgrel=1
pkgdesc="Tools for the Rhai language, including rhai-repl, rhai-run, and rhai-dbg"
arch=('x86_64')
url="https://rhai.rs/"
license=('APACHE' 'MIT')
makedepends=(cargo)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/rhaiscript/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('11b1303830b95efe153c8fcab25628b8304b31f4c2b8ecd0791979800db19e49')

package() {
	cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
	cargo install --no-track --bins --features bin-features --root "$pkgdir/usr/" --path .
	install -Dm644 LICENSE-APACHE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE.txt"
	install -Dm644 LICENSE-MIT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT.txt"
}
