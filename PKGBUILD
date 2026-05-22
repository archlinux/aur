# Maintainer: Borna Punda <borna at punda dot dev>

pkgname=coderabbit
pkgver=0.5.1
pkgrel=1
pkgdesc='AI-powered code review CLI tool'
arch=('x86_64' 'aarch64')
url='https://www.coderabbit.ai/cli'
license=('custom:unfree')
depends=('libsecret')
options=('!strip') # Prevent stripping JS from prepackaged Bun executable

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-arm64.zip")

sha256sums_x86_64=('fa2ba82e061e9900efa3253dc12324dad5fc31e3009609dd2b1ec693fd270672')
sha256sums_aarch64=('462a19bc87f79ad6f06f9f0af18076d426f7ca39a45db07052303be9f1c7b1ae')

package() {
	install -Dm755 "${srcdir}/coderabbit" "${pkgdir}/usr/bin/coderabbit"
}
