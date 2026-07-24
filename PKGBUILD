# Maintainer: Borna Punda <borna at punda dot dev>

pkgname=coderabbit
pkgver=0.7.0
pkgrel=1
pkgdesc='AI-powered code review CLI tool'
arch=('x86_64' 'aarch64')
url='https://www.coderabbit.ai/cli'
license=('custom:unfree')
depends=('git' 'libsecret')
options=('!strip') # Prevent stripping JS from prepackaged Bun executable

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-arm64.zip")

sha256sums_x86_64=('a37038e6efa5cc5913af6aced550a582d9c9cdb91b4a0486f9d350ef04faaaac')
sha256sums_aarch64=('3e3def15da7f17d601ff90e3d1d81ed93b4989c6ae7509e05926d606698158d4')

package() {
	install -Dm755 "${srcdir}/coderabbit" "${pkgdir}/usr/bin/coderabbit"
}
