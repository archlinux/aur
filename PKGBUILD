# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vault-unseal"
pkgname="${_pkgname}-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="Auto-unseal utility for Hashicorp Vault"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/lrstanley/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/releases/download/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64"
)
source_armv7h=(
  "${_pkgsrc}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64"
)
sha256sums=('1758cb7648e7462b1fa4ca92894f353e1b581c867586817fa9f3a9028151a2ec'
            '22d93750efb7875342ea064b53b257af2ab534d304e3bf613e968edf018799eb')
sha256sums_aarch64=('e9c689cf637525aabcb79f6d891f60efbb377038e95a2ffb7b84aa74bb80edae')
sha256sums_armv7h=('a1a2ac33b57df4ac2cdc1301bbcb33370cbef2b585bb9a5d58b67525ddae93e7')
sha256sums_x86_64=('1fea835ac69d34aa873dddfc3871099c916698cfe3d409b9bae7797c10808cad')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
