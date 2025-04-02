# Maintainer: Matej Lach <me@matej-lach.me>
# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tailwindcss-bin
pkgver=4.1.1
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

sha256sums_aarch64=('cd35be7c6224a7059160c4498d944998ee1823927a80e5ce2947eaf4ab46c4a2')
sha256sums_x86_64=('8c85b8366216edd9378934b4258e55ecf17d2df9d62151037183943f49d6a756')

package() {

	install -d "${pkgdir}/usr/bin"

	install -Dm755 "tailwindcss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tailwindcss"
	install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
