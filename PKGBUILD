# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
_pkgname="pay-respects"
pkgver=0.7.6
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
sha1sums=('99c89c57bbd9a03159e564165e879504641df5b9')
sha1sums_x86_64=('68f820ddb21eca660604a2c2ea061a282392753a')
sha1sums_aarch64=('9126cc4baeba3fb8db989309a426836e6ec72db2')
sha1sums_armv7h=('6bb3204dcc92be0892ae5d0deebe270763c1b037')
sha1sums_i686=('5643077e0cf6562e392ee68b178ec36880d86742')

package() {
	install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"

	install -Dm755 "pay-respects" "$pkgdir/opt/pay-respects/bin/pay-respects"
	install -Dm755 "_pay-respects-module-100-runtime-rules" "$pkgdir/usr/lib/pay-respects/_pay-respects-module-100-runtime-rules"
	install -Dm755 "_pay-respects-fallback-100-request-ai" "$pkgdir/usr/lib/pay-respects/_pay-respects-fallback-100-request-ai"

	# install -Dm644  LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ft=sh
