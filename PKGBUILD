# Maintainer: Mikhail Makeev <mihail.makeev@gmail.com>

pkgname=alphai-tui-bin
_pkgname=alphai-tui
pkgver=0.44.0
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
sha256sums_x86_64=('0cd0a139602acb70bea3365255edaa10f75f891792f2750b90c94ef704021ea2')
sha256sums_aarch64=('e1180195e2c9e9d882d8f33f22ceb2d44ed502691478240ee056fc7561f24aaa')

package() {
	local _dir="$_pkgname-$CARCH-unknown-linux-gnu"

	install -Dm755 "$_dir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
