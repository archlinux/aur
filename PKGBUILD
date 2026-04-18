# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vault-unseal"
pkgname="${_pkgname}-bin"
pkgver=1.0.0
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
sha256sums=('a2141e05140c5640eb6311ca5cc224ebd19a8c3cfde6ff70fc1fafb8462e00aa'
            '22d93750efb7875342ea064b53b257af2ab534d304e3bf613e968edf018799eb')
sha256sums_aarch64=('cfcfa38be106b9f581f9ca699f744075c3bb81ea7815c7629fb647ceef1e2601')
sha256sums_armv7h=('e7d79ce76732e5d354d119bb568e11ae8406728f170f4f9bbcad5865d8f39357')
sha256sums_x86_64=('91519d6fbbfc7b999f2dc885c3375f6209531b294bb8971a3e0942c5a9d5ed72')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
