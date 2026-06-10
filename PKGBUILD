# Maintainer: Borna Punda <borna at punda dot dev>

pkgname=coderabbit
pkgver=0.6.0
pkgrel=1
pkgdesc='AI-powered code review CLI tool'
arch=('x86_64' 'aarch64')
url='https://www.coderabbit.ai/cli'
license=('custom:unfree')
depends=('git' 'libsecret')
options=('!strip') # Prevent stripping JS from prepackaged Bun executable

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-arm64.zip")

sha256sums_x86_64=('394877ab350157070c6659732bb01cc2b5c41ec4cfb5da38ee94f751efaef617')
sha256sums_aarch64=('3cb081827b538e6b96629a6f33a3f3bc157df2800a69f7d14ffdda09b74275da')

package() {
	install -Dm755 "${srcdir}/coderabbit" "${pkgdir}/usr/bin/coderabbit"
}
