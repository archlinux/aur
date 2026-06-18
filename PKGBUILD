# Maintainer: hi@devan.gg
pkgname=l
_binname=l
pkgver=0.4.0
pkgrel=1
pkgdesc="an ls replacement"
arch=('x86_64' 'aarch64')
url="https://devan.gg/l"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/l/releases/download/v0.4.0/l-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/l/releases/download/v0.4.0/l-linux-arm64.tar.gz")
sha256sums_x86_64=('db8c71b0143de814f6fa8fe827a8ac44dbff763a6f842775af5b02e6ef667afd')
sha256sums_aarch64=('1de572f1d575c9128b79347bc8007fb019e6b83217d3f8d13f77617b153def17')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
