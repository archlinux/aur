# Maintainer: Matej Lach <me@matej-lach.me>
# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tailwindcss-bin
pkgver=4.0.13
pkgrel=1
pkgdesc='Standalone Tailwind CLI without dependency on Node.js'
arch=("aarch64" "x86_64")
url='https://tailwindcss.com'
license=('MIT')
depends=("glibc")
options=("!strip")
conflicts=('tailwindcss')
provides=('tailwindcss')

source_aarch64=("tailwindcss-${pkgver}-aarch64::https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}/tailwindcss-linux-arm64")
source_x86_64=("tailwindcss-${pkgver}-x86_64::https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}/tailwindcss-linux-x64")

sha256sums_aarch64=('44942d83bd3165fd561b1c4161cc622423404b8985a2f6c1b6978a79d9d12d5f')
sha256sums_x86_64=('5e34e2b5da6e2314c0743d919699e85986c476aaf60b211fae69ef5ec71aa1ca')

package() {

	install -d "${pkgdir}/usr/bin"

	install -Dm755 "tailwindcss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tailwindcss"
	install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
