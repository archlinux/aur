# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
_pkgname="pay-respects"
pkgver=0.8.4
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
sha1sums_x86_64=('3298dee34faeeeddfda0d8b2d228431bee3dd010')
sha1sums_aarch64=('19bbceaab3d4de9d04bafb63848d73bca9031199')
sha1sums_armv7h=('fee8cbd6fb3fac1010d6fc350fe56adb02c62e86')
sha1sums_i686=('301b2c976d753cb09a92dc43ecc8a8d7fc3e3fd0')

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
