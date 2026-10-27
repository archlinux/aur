# Maintainer: Mikhail Makeev <mihail.makeev@gmail.com>

pkgname=alphai-tui-bin
_pkgname=alphai-tui
pkgver=0.36.0
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
sha256sums_x86_64=('678d2c6afbd8b98edfa3e423d2057debca96f6a01d47e17c056403ccc03aa102')
sha256sums_aarch64=('2438e0eccfa3fe1cd46c2c7c917ca10eb6f966aa3c1525df8f1831e20de784cb')

package() {
	local _dir="$_pkgname-$CARCH-unknown-linux-gnu"

	install -Dm755 "$_dir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
