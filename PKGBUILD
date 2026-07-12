# Maintainer: hi@devan.gg
pkgname=go-cli-template
_binname=go-cli-template
pkgver=0.2.3
pkgrel=1
pkgdesc="A generic CLI tool template built with Go, Cobra, and Bubble Tea. This template provides a foundation for building interactive command-line applications with a clean architecture and modern UI components."
arch=('x86_64' 'aarch64')
url="https://devan.gg/go-cli-template"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/go-cli-template/releases/download/v${pkgver}/${_binname}-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/go-cli-template/releases/download/v${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('9956d25479dc62b5b836559dc1321c7965fbbb2647657111d3843e1ff1016c4f')
sha256sums_aarch64=('79d8ef0d55456df2e1214d79de805495122becfaea12f207a694c9917b02b196')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
