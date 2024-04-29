# Maintainer: Nikolay Arhipov <n at arhipov dot net>
pkgname=env-secrets-bin
pkgver=0.0.5
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

sha256sums=('6a26299d2b0404e01233f7256877790ae03d3708a20e77ac71270df3ec752b8c')

package() {
	install -Dm755 "${srcdir}/env-secrets" "${pkgdir}/usr/bin/env-secrets"
	install -Dm644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

