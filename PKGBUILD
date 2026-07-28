# Maintainer: hi@devan.gg
pkgname=timr-cli
_binname=timr
pkgver=0.4.2
pkgrel=1
pkgdesc="A simple cli timer"
arch=('x86_64' 'aarch64')
url="https://devan.gg/timr"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/timr-cli/releases/download/v${pkgver}/${_binname}-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/timr-cli/releases/download/v${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('037879a1bb6ac5eeee818621e1ccac35b26e280194ada6ba97f57fbefcc2126e')
sha256sums_aarch64=('01445f46983ddfff029f51f97f1144ec2c5d1d686d4dd2b4aa9e4a6882dd222d')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
