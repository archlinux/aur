# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='chronic'
pkgname="${_pkgname}-bin"
pkgver=1.0.11
pkgrel=1
pkgdesc='Tool that hides cron output unless the command fails'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/docwhat/chronic'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}-README.md::${url}/raw/master/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/master/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64")
source_armv6h=("${_pkgname}-${pkgver}-armv6h::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6")
source_armv7h=("${_pkgname}-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv7")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64")

# NB: updpkgsums: README.md, LICENSE == SKIP
sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('a407e1bab1fcea63395cc342fd74f422c15c7c8d970fadba741e93ea7ad567d8')
sha256sums_armv6h=('8cc2baa2fab9a36a9f7f3d51661178a55701040e906bf0b576890e255ec09548')
sha256sums_armv7h=('34b9585b8e7d60f91b9b1cfe310eb41bbca1548c9e9abf7c964155faced13eea')
sha256sums_aarch64=('fe8424e95e52d92d6220b8407953db402cd83399d6b79cfb7ca64c52c0221d04')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
