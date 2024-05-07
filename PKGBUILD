# Maintainer: Nikolay Arhipov <n at arhipov dot net>
pkgname=env-secrets-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="A CLI tool to set env variables with secrets in shell from the secret-service"
arch=('x86_64' 'aarch64')
url="https://github.com/nikarh/env-secrets"
license=('MIT')
provides=('env-secrets')
conflicts=('env-secrets')

source=(
	"env-secrets-${arch}-unknown-linux-gnu-v${pkgver}.tar.gz::https://github.com/nikarh/env-secrets/releases/download/v${pkgver}/env-secrets-${arch}-unknown-linux-gnu-v${pkgver}.tar.gz"
)

sha256sums=('1ff0163b88f5c7422bd257616ab179f69bcf3690977d76f4c648b9a462a15517')

package() {
	install -Dm755 "${srcdir}/env-secrets" "${pkgdir}/usr/bin/env-secrets"
	install -Dm644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

