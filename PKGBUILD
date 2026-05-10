# Maintainer: Borna Punda <borna at punda dot dev>

pkgname=coderabbit
pkgver=0.4.5
pkgrel=2
pkgdesc='AI-powered code review CLI tool'
arch=('x86_64' 'aarch64')
url='https://www.coderabbit.ai/cli'
license=('custom:unfree')
depends=('libsecret')
options=('!strip') # Prevent stripping JS from prepackaged Bun executable
conflicts=('cr')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://cli.coderabbit.ai/releases/${pkgver}/coderabbit-linux-arm64.zip")

sha256sums_x86_64=('d9bbab0b6e41ff708596de47c2606df3820ccf6c65b5b15f0e478ef076b05ba0')
sha256sums_aarch64=('953459e17dfaa8e0087292c074e4bcd50527266714b12e0e04eb0afa03c0fb43')

package() {
	# Install binary
	install -Dm755 "${srcdir}/coderabbit" "${pkgdir}/usr/bin/coderabbit"

	# Create short alias
	ln -s coderabbit "${pkgdir}/usr/bin/cr"
}
