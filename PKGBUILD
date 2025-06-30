# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vault-unseal"
pkgname="${_pkgname}-bin"
pkgver=0.7.2
pkgrel=1
pkgdesc="Auto-unseal utility for Hashicorp Vault"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/lrstanley/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64")
source_armv7h=("${_pkgsrc}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64")
sha256sums=('3179b4dd52a5d1aadab46b0b58fa303c006cdd832cf4b746c3f80120dffb6539'
            '22d93750efb7875342ea064b53b257af2ab534d304e3bf613e968edf018799eb')
sha256sums_aarch64=('85b92ad85ad6aa9ff4501bf772ada6a81228d5bff25ab2bfe40fc5cf0c0bed52')
sha256sums_armv7h=('78b9312e1b6a83157f159457efdcbc32ca650edc46748254435d17b4414208fe')
sha256sums_x86_64=('f6e2ee07a4e10e73b9518a6d45e22ff68797c8a78dbedc7df5789dc279b60284')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
