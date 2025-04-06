# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
_pkgname="pay-respects"
pkgver=0.7.1
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
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86-64::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-x86_64-unknown-linux-musl.tar.zst")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-aarch64-unknown-linux-musl.tar.zst")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-armv7-unknown-linux-musleabihf.tar.zst")
source_i686=("$pkgname-$pkgver-$pkgrel-i686::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-i686-unknown-linux-musl.tar.zst")
sha1sums=('0f0faf5b196063ce3ebca3dc12ecd963ed4130eb')
sha1sums_x86_64=('5a8fdf16456c4000d9165bb6457c22ed84196a80')
sha1sums_aarch64=('474e5683476332faa7796c030913424c9bb312a4')
sha1sums_armv7h=('a2ef733270504580cbcd52dbf6a3339a54689f99')
sha1sums_i686=('2c5d6c30de2ffb8310b09e51fcf45d34a06ad72a')

package() {
	install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"

	install -Dm755 "pay-respects" "$pkgdir/opt/pay-respects/bin/pay-respects"
	install -Dm755 "_pay-respects-module-100-runtime-rules" "$pkgdir/usr/lib/pay-respects/_pay-respects-module-100-runtime-rules"
	install -Dm755 "_pay-respects-fallback-100-request-ai" "$pkgdir/usr/lib/pay-respects/_pay-respects-fallback-100-request-ai"

	install -Dm644  LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ft=sh
