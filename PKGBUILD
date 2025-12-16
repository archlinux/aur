# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
pkgname=jinja-lsp
pkgver=0.1.90
pkgrel=1
pkgdesc="Language Server for jinja"
arch=(any)
url=https://github.com/uros-5/jinja-lsp
license=(GPL3)
makedepends=(cargo)
conflicts=("$pkgname")
provides=("$pkgname")
source=("https://github.com/uros-5/jinja-lsp/archive/v$pkgver.tar.gz")
sha256sums=('bb61303c318bee8c9c30e23dc1cf618192d1de87f6b2f9acb92b2e358a45e4cf')

build() {
	cd "$pkgname-$pkgver" || return 1

	cargo build --release
}

package() {
	cd "$pkgname-$pkgver" || return 1

	install -D "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
