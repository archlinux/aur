# Maintainer: Borna Punda <borna at punda dot dev>

pkgname=coderabbit
pkgver=0.7.1
pkgrel=1
pkgdesc='AI-powered code review CLI tool'
arch=('x86_64' 'aarch64')
url='https://www.coderabbit.ai/cli'
license=('custom:unfree')
depends=('git' 'libsecret')
options=('!strip') # Prevent stripping JS from prepackaged Bun executable

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-arm64.zip")

sha256sums_x86_64=('ae83a06176f84ce7d47dc25ef8acac157739d56a8ca59ea7d1094f8fa30c537a')
sha256sums_aarch64=('7382cc6d8f8c96fcb93f2810626f61bf6d6cbb9ee81334478350aebc0411bd2a')

package() {
	install -Dm755 "${srcdir}/coderabbit" "${pkgdir}/usr/bin/coderabbit"
}
