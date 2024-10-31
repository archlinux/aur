# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bitrise"
pkgname="${_pkgname}-bin"
pkgver=2.23.0
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
source=("README-${pkgver}.md::${_url}/raw/${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/${pkgver}/LICENSE"
        "${_pkgname}.install")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/${pkgver}/${_pkgname}-Linux-x86_64")
sha256sums=('6f12f8b54f71a1b23bd3e39a9f756bdc397199eb777207333b364bf202c2d18d'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414'
            '66525077041db7dd99430492bee9a957c05c1656d14b9157f3d93cb91debe5ff')
sha256sums_x86_64=('22784273399ed85395191fa1c95b9bb4176d76c65f140bab44ddea6f752010d5')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
