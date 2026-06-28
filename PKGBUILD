# Maintainer: Borna Punda <borna at punda dot dev>

pkgname=coderabbit
pkgver=0.6.2
pkgrel=1
pkgdesc='AI-powered code review CLI tool'
arch=('x86_64' 'aarch64')
url='https://www.coderabbit.ai/cli'
license=('custom:unfree')
depends=('git' 'libsecret')
options=('!strip') # Prevent stripping JS from prepackaged Bun executable

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-arm64.zip")

sha256sums_x86_64=('f63a7b5cd557ec873cefc25e8694078cae6db9ae9df604c17a53b4e9cc7f7755')
sha256sums_aarch64=('6bbf4df0828bd64b2ef7894d8045308dd235d7536b5d6a5e975d373c958f42fb')

package() {
	install -Dm755 "${srcdir}/coderabbit" "${pkgdir}/usr/bin/coderabbit"
}
