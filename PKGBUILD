# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vault-unseal"
pkgname="${_pkgname}-bin"
pkgver=0.7.0
pkgrel=1
pkgdesc="Auto-unseal utility for Hashicorp Vault"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://github.com/lrstanley/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64")
source_armv6h=("${_pkgsrc}-armv6h::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6")
sha256sums=('fd2a1771c0ddae0927a8fc438d90f317845daec3e33b02a545b0550415c647df'
            '22d93750efb7875342ea064b53b257af2ab534d304e3bf613e968edf018799eb')
sha256sums_x86_64=('541cd82761a452c8c498737f285ea7ead912c1408f7d84631b3aa2433eb6a659')
sha256sums_aarch64=('99a7620e521488edc7edac3db9852b2167460c3eca36fc85f9eb3cae7f7b135a')
sha256sums_armv6h=('9dd42d4c25c867cd7b910ae02743c3f6f3c7f9c4822a127249bcd521d0313617')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
