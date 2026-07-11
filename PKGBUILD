# Maintainer: hi@devan.gg
pkgname=go-cli-package
_binname=go-cli-package
pkgver=0.3.4
pkgrel=1
pkgdesc="A go cli to deploy your go cli package."
arch=('x86_64' 'aarch64')
url="https://devan.gg/go-cli-package"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/go-cli-package/releases/download/v${pkgver}/${_binname}-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/go-cli-package/releases/download/v${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('03746e2aae52f67d6b39ecb7bf85c5012cb6e8c02d32a2127de09329f3af6e3a')
sha256sums_aarch64=('3b6df67ffc9b2372e8e0b01c4c704b5f9431830ff5adaca9f5b653a431251ef8')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
