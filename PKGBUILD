# Maintainer: Tim Paik <timpaik@163.com>
pkgname=rhai-tools
_pkgname=rhai
pkgver=1.24.0
pkgrel=1
pkgdesc="Tools for the Rhai language, including rhai-repl, rhai-run, and rhai-dbg"
arch=('x86_64')
url="https://rhai.rs/"
license=('APACHE' 'MIT')
makedepends=(cargo)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/rhaiscript/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2256dc43858be79516e8975948aca7fd66977ba9c445376c00b24b4a289c1cf1')

package() {
	cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
	cargo install --no-track --bins --features bin-features --root "$pkgdir/usr/" --path .
	install -Dm644 LICENSE-APACHE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE.txt"
	install -Dm644 LICENSE-MIT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT.txt"
}
