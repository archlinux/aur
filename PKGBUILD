# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
# Co-Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
pkgname=atmos-bin
pkgver=1.216.0
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64 aarch64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source_x86_64=("${pkgname/-bin/}_${pkgver}_linux_amd64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
source_aarch64=("${pkgname/-bin/}_${pkgver}_linux_arm64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64")
sha512sums_x86_64=('35ff7b15f91da8a54fc2f0dd8bf59669394c28424f02290b06bddb9b94f711e2ab812d6131763f7be088fe57439436e275a8340a47d41247cc611bb2befeae9b')
sha512sums_aarch64=('9837ea9c42380e1cbae5939d1a4baa212d2976d959a3ed736b4faa6f7aae0e8be9284942c67a5c1a42bd73aa507f09577795ff6e8c043fbc0b713902ca9acf6d')
b2sums_x86_64=('2938b4cdc275dba221f7b43eac266a5e1a6e2b670d192fca15adc40598bcfde71899b21b591963619ef3cc0314a75eae9169194c0581a854a63da0e69767491f')
b2sums_aarch64=('5b14380fbeee3a746f2c42a1b6d93252ae6c133ba5ca8b47d69c58e4bfebdc993d419bf2a127fc6c5e894a4b612294f97794882d8c25d2d8db4d7c04b6b9f42a')

package() {
  local _srcarch='amd64'

  [[ "${CARCH}" == 'aarch64' ]] && _srcarch='arm64'

  install -Dm755 \
    "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_${_srcarch}" \
    "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
