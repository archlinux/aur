# Maintainer: Borna Punda <borna at punda dot dev>

pkgname=coderabbit
pkgver=0.5.0
pkgrel=1
pkgdesc='AI-powered code review CLI tool'
arch=('x86_64' 'aarch64')
url='https://www.coderabbit.ai/cli'
license=('custom:unfree')
depends=('libsecret')
options=('!strip') # Prevent stripping JS from prepackaged Bun executable

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-arm64.zip")

sha256sums_x86_64=('42bb5e1ff4f043248eb49bcc43ad62c04daa37e929a66148a71afc7ff99861d7')
sha256sums_aarch64=('2e88ee5894ef1a359e65f94833584abc00e4e95b1b0b26b62c399b1e2ce52778')

package() {
	install -Dm755 "${srcdir}/coderabbit" "${pkgdir}/usr/bin/coderabbit"
}
