# Maintainer: Mikhail Makeev <mihail.makeev@gmail.com>

pkgname=alphai-tui-bin
_pkgname=alphai-tui
pkgver=0.22.0
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
sha256sums_x86_64=('9cb1de0b190f0886f505320e547c1717654f611b2453833b4e559bd23edd0d4e')
sha256sums_aarch64=('beb05b6a0cb39aafb1b6b0522a859f0822d4a6707ec64e467cdf469d6776ca75')

package() {
	local _dir="$_pkgname-$CARCH-unknown-linux-gnu"

	install -Dm755 "$_dir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
