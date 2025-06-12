# Maintainer: Matej Lach <me@matej-lach.me>
# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tailwindcss-bin
pkgver=4.1.10
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
source=("LICENSE.txt::https://raw.githubusercontent.com/tailwindlabs/tailwindcss/refs/heads/main/LICENSE")

sha256sums=('60e0b68c0f35c078eef3a5d29419d0b03ff84ec1df9c3f9d6e39a519a5ae7985')
sha256sums_aarch64=('67eb620bb404c2046d3c127dbf2d7f9921595065475e7d2d528e39c1bb33c9b6')
sha256sums_x86_64=('0a85a3e533f2e7983bdb91c08ea44f0eab3becc275e60b3baaddf18f71d390bf')

package() {

	install -d "${pkgdir}/usr/bin"

	install -Dm755 "tailwindcss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tailwindcss"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
