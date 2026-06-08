# Maintainer: Borna Punda <borna at punda dot dev>

pkgname=coderabbit
pkgver=0.5.4
pkgrel=1
pkgdesc='AI-powered code review CLI tool'
arch=('x86_64' 'aarch64')
url='https://www.coderabbit.ai/cli'
license=('custom:unfree')
depends=('git' 'libsecret')
options=('!strip') # Prevent stripping JS from prepackaged Bun executable

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-arm64.zip")

sha256sums_x86_64=('9371a2b8768848f68b1a3f17e6315491009f46108820ade097da98fec5bac70a')
sha256sums_aarch64=('e57e53cd447e1b8faed767c34715bfab2816df4bb5e7e2eb91b6163af8b15dc8')

package() {
	install -Dm755 "${srcdir}/coderabbit" "${pkgdir}/usr/bin/coderabbit"
}
