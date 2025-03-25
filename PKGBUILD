# Maintainer: Matej Lach <me@matej-lach.me>
# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tailwindcss-bin
pkgver=4.0.16
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

sha256sums_aarch64=('dca0b66681f27008fffab56944acf2b60de88b9e3f922495894d661f0aa015af')
sha256sums_x86_64=('134587714e2ccdaf742ac30002d5fdf2164d92e51c8cab56aaa76de6cc0932b5')

package() {

	install -d "${pkgdir}/usr/bin"

	install -Dm755 "tailwindcss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tailwindcss"
	install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
