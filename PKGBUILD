# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
_pkgname="pay-respects"
pkgver=0.8.6
pkgrel=1
pkgdesc="Command suggestions, command-not-found and thefuck replacement written in Rust (All modules)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/iffse/pay-respects"
license=('AGPL-3.0-or-later ')
provides=('pay-respects')
install="$_pkgname.install"
conflicts=('pay-respects')
makedepends=()
optdepends=(
	'tmux: tmux integration'
	'screen: screen integration'
	'zellij: zellij integration'
	'wezterm: wezterm integration'
	'kitty: kitty integration'
	'zoxide: zoxide integration')
source=(${_pkgname}.sh)
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86-64::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-x86_64-unknown-linux-musl.tar.zst")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-aarch64-unknown-linux-musl.tar.zst")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-armv7-unknown-linux-musleabihf.tar.zst")
source_i686=("$pkgname-$pkgver-$pkgrel-i686::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-i686-unknown-linux-musl.tar.zst")
sha1sums=('99c89c57bbd9a03159e564165e879504641df5b9')
sha1sums_x86_64=('a900f8fe1fb5cde6ec848d3952b503e247abdc10')
sha1sums_aarch64=('025cc57da5462470b2fd6335dfdc61483b2f234e')
sha1sums_armv7h=('fb3214b7ca6c6f44405c31e0ab71f051aec3da30')
sha1sums_i686=('5b08c471e9884915f7015657932c313043a9eb6b')

package() {
	install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"

	install -Dm755 "pay-respects" "$pkgdir/opt/pay-respects/bin/pay-respects"
	install -Dm755 "_pay-respects-module-100-runtime-rules" "$pkgdir/usr/lib/pay-respects/_pay-respects-module-100-runtime-rules"
	install -Dm755 "_pay-respects-fallback-100-request-ai" "$pkgdir/usr/lib/pay-respects/_pay-respects-fallback-100-request-ai"

	install -Dm644 "man/pay-respects.1" "$pkgdir/usr/share/man/man1/pay-respects.1"
	install -Dm644 "man/pay-respects-rules.5" "$pkgdir/usr/share/man/man5/pay-respects-rules.5"
	install -Dm644 "man/pay-respects-modules.5" "$pkgdir/usr/share/man/man5/pay-respects-modules.5"

	# install -Dm644  LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ft=sh
