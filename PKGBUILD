# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
_pkgname="pay-respects"
pkgver=0.7.5
pkgrel=1
pkgdesc="Command suggestions, command-not-found and thefuck replacement written in Rust (All modules)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/iffse/pay-respects"
license=('AGPL-3.0-or-later ')
provides=('pay-respects')
install="$_pkgname.install"
conflicts=('pay-respects')
makedepends=()
optdepends=()
source=(${_pkgname}.sh)
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86-64::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-x86_64-unknown-linux-musl.tar.zst")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-aarch64-unknown-linux-musl.tar.zst")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-armv7-unknown-linux-musleabihf.tar.zst")
source_i686=("$pkgname-$pkgver-$pkgrel-i686::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-i686-unknown-linux-musl.tar.zst")
sha1sums=('0f0faf5b196063ce3ebca3dc12ecd963ed4130eb')
sha1sums_x86_64=('f922608dd607e6112dc8d37173cf84cb1fe2c619')
sha1sums_aarch64=('26aa86c5929152059eb14292976539ffaa0927d6')
sha1sums_armv7h=('43655fa805ac8c2f5227f390949c0473b999819d')
sha1sums_i686=('3f8986e77832ba46d9c75a32f25f493b502fa850')

package() {
	install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"

	install -Dm755 "pay-respects" "$pkgdir/opt/pay-respects/bin/pay-respects"
	install -Dm755 "_pay-respects-module-100-runtime-rules" "$pkgdir/usr/lib/pay-respects/_pay-respects-module-100-runtime-rules"
	install -Dm755 "_pay-respects-fallback-100-request-ai" "$pkgdir/usr/lib/pay-respects/_pay-respects-fallback-100-request-ai"

	# install -Dm644  LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ft=sh
