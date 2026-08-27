# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
# Co-Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
pkgname=atmos-bin
pkgver=1.227.0
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64 aarch64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source_x86_64=("${pkgname/-bin/}_${pkgver}_linux_amd64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
source_aarch64=("${pkgname/-bin/}_${pkgver}_linux_arm64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64")
sha256sums_x86_64=('430b7f681c1b8dda9368f7f5bb33b63f74025cacb3d9691296b5dac53fe6e6af')
sha256sums_aarch64=('9b910778a57d48dab27320cffb56c68a1fd89f6277d84bf86bfa3465f45d8e1c')

package() {
  local _srcarch='amd64'

  [[ "${CARCH}" == 'aarch64' ]] && _srcarch='arm64'

  install -Dm755 \
    "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_${_srcarch}" \
    "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
