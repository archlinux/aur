# Maintainer: Borna Punda <borna at punda dot dev>

pkgname=coderabbit
pkgver=0.6.3
pkgrel=1
pkgdesc='AI-powered code review CLI tool'
arch=('x86_64' 'aarch64')
url='https://www.coderabbit.ai/cli'
license=('custom:unfree')
depends=('git' 'libsecret')
options=('!strip') # Prevent stripping JS from prepackaged Bun executable

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-arm64.zip")

sha256sums_x86_64=('84ee70c23eb4d22666b5ec2ee43a347e101baf4f65f98f666663de7f8b34b709')
sha256sums_aarch64=('bc5814e9ab7e05085f1a6896d5b7114ea42c1fa73218a0735d29a5524e68fd91')

package() {
	install -Dm755 "${srcdir}/coderabbit" "${pkgdir}/usr/bin/coderabbit"
}
