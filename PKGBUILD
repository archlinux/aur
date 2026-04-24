# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
_pkgname="pay-respects"
pkgver=0.8.7
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
sha1sums_x86_64=('04b723b836630916e3802367eb1323f51667f3de')
sha1sums_aarch64=('c3b541c934bf5449f9c4ff1a051fb72bf8f61a7d')
sha1sums_armv7h=('32791aeab5f420d808f13380eee5b017d0dc4bae')
sha1sums_i686=('6f699adc8b64048607e9d14cee0869b2cd30dcd7')

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
