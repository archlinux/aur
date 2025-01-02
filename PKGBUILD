# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
_pkgname="pay-respects"
pkgver=0.6.8
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
	'curl: AI requests'
)
source=(${_pkgname}.sh)
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86-64::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-x86_64-unknown-linux-gnu.tar.zst")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-aarch64-unknown-linux-gnu.tar.zst")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-armv7-unknown-linux-gnueabihf.tar.zst")
source_i686=("$pkgname-$pkgver-$pkgrel-i686::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-i686-unknown-linux-gnu.tar.zst")
sha1sums=('0f0faf5b196063ce3ebca3dc12ecd963ed4130eb')
sha1sums_x86_64=('0329f58094f6be8578569640f1af481bb8964aac')
sha1sums_aarch64=('0f6486bed9e080cdfd75ee657c4a27c40fb190c4')
sha1sums_armv7h=('64cacd3630d8c4cff9ede64a25107137597a17dd')
sha1sums_i686=('fa487aa69849549dd5c9bd000292ffbdad936e69')

package() {
	install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"

	install -Dm755 "pay-respects" "$pkgdir/opt/pay-respects/bin/pay-respects"
	install -Dm755 "_pay-respects-module-100-runtime-rules" "$pkgdir/usr/lib/pay-respects/_pay-respects-module-100-runtime-rules"
	install -Dm755 "_pay-respects-fallback-100-request-ai" "$pkgdir/usr/lib/pay-respects/_pay-respects-fallback-100-request-ai"

	install -Dm644  LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ft=sh
