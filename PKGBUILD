# Maintainer: Mikhail Makeev <mihail.makeev@gmail.com>

pkgname=alphai-tui-bin
_pkgname=alphai-tui
pkgver=0.33.0
pkgrel=1
pkgdesc="Terminal stock dashboard with live charts, AI-scored news and SEC Form 4 trades"
arch=('x86_64' 'aarch64')
url="https://github.com/makeev/alphai-tui"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.xz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.xz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('2bbe818c488df68682d866835e2ea9aa4e1723295da1e949e8b7bbd5182c513f')
sha256sums_aarch64=('e5067bf0d53046925eba04349e4a09bfca3650752d8586b8b0e91f2cc73f6f38')

package() {
	local _dir="$_pkgname-$CARCH-unknown-linux-gnu"

	install -Dm755 "$_dir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
