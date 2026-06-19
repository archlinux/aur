# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
# Co-Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
pkgname=atmos-bin
pkgver=1.221.1
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64 aarch64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source_x86_64=("${pkgname/-bin/}_${pkgver}_linux_amd64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
source_aarch64=("${pkgname/-bin/}_${pkgver}_linux_arm64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64")
sha512sums_x86_64=('e14b5d797c43a2eb92d67f5acb3ae16feed54ea1df01640abb10c455b0ed1d81b17a9a41f9aa7999b73737b48709f3d8e36c8e5536a16dfe003efc54aa2ddb14')
sha512sums_aarch64=('ec78a12d44ddc71f152c3359133328fc168b1b0166b46c475b436e99eb71dfe956021f77086996fc8cc72667daae0c1274bdc405fba9acb29e943b485817dadb')
b2sums_x86_64=('d02cd5d9facdc0a77ec248053d5983f43e8ed6fcedf864d9802c39d0f2952e82c64a5e025ca5d38fff51659e5ab5138b6363153f018b3f67973044d81a1cb63c')
b2sums_aarch64=('608ea36af88f1acedaa8bc6ca0cb227d0cac7aeae7774fd606a1f4a67d413bce98cb7fcf7d057c2a12e60f99fc4571dfaa55568ab97acbb53accd8fd71d50ea7')

package() {
  local _srcarch='amd64'

  [[ "${CARCH}" == 'aarch64' ]] && _srcarch='arm64'

  install -Dm755 \
    "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_${_srcarch}" \
    "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
