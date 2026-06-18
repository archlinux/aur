# Maintainer: hi@devan.gg
pkgname=l
_binname=l
pkgver=0.3.0
pkgrel=1
pkgdesc="an ls replacement"
arch=('x86_64' 'aarch64')
url="https://devan.gg/l"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/l/releases/download/v0.3.0/l-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/l/releases/download/v0.3.0/l-linux-arm64.tar.gz")
sha256sums_x86_64=('23d3d0dc7825a7b4cfb0db3bc244c619e4e210d5d526b1739b2f1ededffc823e')
sha256sums_aarch64=('e72a8393aab5b007fce1f9672a5d84d5dbf3c60c0a9ca8cb9b6ad2440ea82925')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
