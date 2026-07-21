# Maintainer: hi@devan.gg
pkgname=aliases
_binname=aliases
pkgver=1.4.0
pkgrel=1
pkgdesc="An alias manager for your favorite shell"
arch=('x86_64' 'aarch64')
url="https://devan.gg/aliases"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/aliases/releases/download/v${pkgver}/${_binname}-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/aliases/releases/download/v${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('5f5b3fe70f272548196c2e70b9d81a7254aa4b93619697b29e8245c9c9bb2fd8')
sha256sums_aarch64=('ac03077aa254953dc0256585a2953135dea7281813b360c61ca9e08d8ecf166f')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
