# Maintainer: Borna Punda <borna at punda dot dev>

pkgname=coderabbit
pkgver=0.6.1
pkgrel=1
pkgdesc='AI-powered code review CLI tool'
arch=('x86_64' 'aarch64')
url='https://www.coderabbit.ai/cli'
license=('custom:unfree')
depends=('git' 'libsecret')
options=('!strip') # Prevent stripping JS from prepackaged Bun executable

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-arm64.zip")

sha256sums_x86_64=('e7b8517e955de08d3c19a81ac92f0c685e6f3f837e02c91a40ea557b2afdc68a')
sha256sums_aarch64=('e4c4e32e921e017464ec0b0759987fdf5ef7f4259efe8a23c1a1115c12917856')

package() {
	install -Dm755 "${srcdir}/coderabbit" "${pkgdir}/usr/bin/coderabbit"
}
