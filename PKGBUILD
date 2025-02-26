# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bitrise"
pkgname="${_pkgname}-bin"
pkgver=2.29.4
pkgrel=1
pkgdesc="Run your bitrise.io automations offline"
arch=('x86_64')
url="https://www.bitrise.io/cli"
_url="https://github.com/bitrise-io/${_pkgname}"
license=('MIT')
optdepends=('envman: manage Environment Variable collections'
            'stepman: manage decentralized StepLib Step (script) collections')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-Linux-x86_64")
sha256sums=('6f12f8b54f71a1b23bd3e39a9f756bdc397199eb777207333b364bf202c2d18d'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
sha256sums_x86_64=('3919edca8a8931db4fd3916f303d0b9230b5c2690430c8caee12da9a1bc9b811')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
