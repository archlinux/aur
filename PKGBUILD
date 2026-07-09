# Maintainer: Borna Punda <borna at punda dot dev>

pkgname=coderabbit
pkgver=0.6.5
pkgrel=1
pkgdesc='AI-powered code review CLI tool'
arch=('x86_64' 'aarch64')
url='https://www.coderabbit.ai/cli'
license=('custom:unfree')
depends=('git' 'libsecret')
options=('!strip') # Prevent stripping JS from prepackaged Bun executable

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-arm64.zip")

sha256sums_x86_64=('8280dcf8228d087b78fbe8955b8c5ef3f83f73fd46d9a009453948547d304a99')
sha256sums_aarch64=('f056120ef8a1eb641cfb9b40bbd36dad2835f341a1dca09ea7767a94c1e8309b')

package() {
	install -Dm755 "${srcdir}/coderabbit" "${pkgdir}/usr/bin/coderabbit"
}
