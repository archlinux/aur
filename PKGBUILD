# Maintainer: Matej Lach <me@matej-lach.me>
# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tailwindcss-bin
pkgver=4.1.11 # datasource=github-releases depName=tailwindlabs/tailwindcss
pkgrel=1
pkgdesc='Standalone Tailwind CLI without dependency on Node.js'
arch=("aarch64" "x86_64")
url='https://tailwindcss.com'
license=('MIT')
depends=("glibc")
options=("!strip")
conflicts=('tailwindcss')
provides=('tailwindcss')

_baseurl="https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}"

source_aarch64=("tailwindcss-${pkgver}-aarch64::${_baseurl}/tailwindcss-linux-arm64")
source_x86_64=("tailwindcss-${pkgver}-x86_64::${_baseurl}/tailwindcss-linux-x64")

source=("https://raw.githubusercontent.com/tailwindlabs/tailwindcss/refs/tags/v${pkgver}/LICENSE")

sha256sums=('60e0b68c0f35c078eef3a5d29419d0b03ff84ec1df9c3f9d6e39a519a5ae7985')
sha256sums_aarch64=('0409aa4222969f47fa6f4160fe5387e79bf7269e7afe0e8b22f7532c98e1d314')
sha256sums_x86_64=('64805b84af4292e043ea6f86d242f191c0ac75359c1a498455dfe6c642afdbab')

package() {

	install -d "${pkgdir}/usr/bin"

	install -Dm755 "tailwindcss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tailwindcss"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
