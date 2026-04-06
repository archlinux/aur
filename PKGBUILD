# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
# Co-Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
pkgname=atmos-bin
pkgver=1.214.0
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64 aarch64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source_x86_64=("${pkgname/-bin/}_${pkgver}_linux_amd64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
source_aarch64=("${pkgname/-bin/}_${pkgver}_linux_arm64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64")
sha512sums_x86_64=('d5bdb6bc1b869d47998c7aa504dce71439df2edcc841680d3a276eb237275a174e4fe63337f2f4124d09420f21b44cf598e0b0f849308219b4b585b2731d9bad')
sha512sums_aarch64=('096b51550c74c7ee394b1012070a214c67a047910ab6abc46f763b729a691888d497721e07dc6ab8c7dfee5923aa6c7c734de4ba21980d26ca8d997c74fc1651')
b2sums_x86_64=('6fdc58e3f4749710ffbd8f345b21a79687c0e583ecaeef07bfa3de13959bad51a687c317aa3816e82939db63448f2f8a2080e6bf6e7106c8db001814243dea39')
b2sums_aarch64=('3e24ad364b6b407e9911c949c34f47c37b9e16182eb7ecff582753499dfddc85f26b612bd0cda5d8368501ad11a268c3efb4dc7822ae658945c053c4e3274027')

package() {
  local _srcarch='amd64'

  [[ "${CARCH}" == 'aarch64' ]] && _srcarch='arm64'

  install -Dm755 \
    "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_${_srcarch}" \
    "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
