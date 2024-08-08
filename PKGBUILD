# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vault-unseal"
pkgname="${_pkgname}-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="Auto-unseal utility for Hashicorp Vault"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://github.com/lrstanley/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64")
source_armv6h=("${_pkgsrc}-armv6h::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6")
sha256sums=('e577a885a220b8ac2653154c0579f1e80dd26ef770bcd157f1939b79371ce33d'
            '22d93750efb7875342ea064b53b257af2ab534d304e3bf613e968edf018799eb')
sha256sums_x86_64=('67d5afab02a86b1dc1525c4f5c371f22daee587ce4d5631c6c9f5f61d3fa9cd8')
sha256sums_aarch64=('4327955144eb280401db9b5758ef33ce2c32b2afd5cd38e14684a822f8f9ebdb')
sha256sums_armv6h=('7b37e0066d7e124ef3ca4119a2b0a566fdc0ba5c68daf1c3ea27c7719a4ab059')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
