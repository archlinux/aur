# Maintainer: Matej Lach <me@matej-lach.me>
# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tailwindcss-bin
pkgver=4.0.4
pkgrel=1
pkgdesc='Standalone Tailwind CLI without dependency on Node.js'
arch=("aarch64" "x86_64")
url='https://tailwindcss.com'
license=('MIT')
depends=("glibc")
options=(!strip)
conflicts=('tailwindcss')
provides=('tailwindcss')

source_aarch64=("tailwindcss-aarch64::https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}/tailwindcss-linux-x64")
source_x86_64=("tailwindcss-x86_64::https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}/tailwindcss-linux-x64")

sha256sums_aarch64=('9e2e6d8af6dbb95dd4df5c9d99df6304b05df1d1f770000f170487991017b9b4')
sha256sums_x86_64=('9e2e6d8af6dbb95dd4df5c9d99df6304b05df1d1f770000f170487991017b9b4')

package() {

    install -d "${pkgdir}/usr/bin"

    install -Dm755 "tailwindcss-${CARCH}" "${pkgdir}/usr/bin/tailwindcss"
	install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
