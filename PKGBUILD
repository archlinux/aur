# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=bitrise
pkgname=${_pkgname}-bin
pkgver=2.16.1
pkgrel=1
pkgdesc="Run your bitrise.io automations offline"
arch=('x86_64')
url="https://github.com/bitrise-io/${_pkgname}"
license=('MIT')
optdepends=('envman: manage Environment Variable collections'
            'stepman: manage decentralized StepLib Step (script) collections')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/${pkgver}/README.md"
        "${url}/raw/${pkgver}/LICENSE"
        "${_pkgname}.install")
source_x86_64=("${_pkgsrc}::${url}/releases/download/${pkgver}/${_pkgname}-Linux-x86_64")
sha256sums=('6f12f8b54f71a1b23bd3e39a9f756bdc397199eb777207333b364bf202c2d18d'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414'
            '66525077041db7dd99430492bee9a957c05c1656d14b9157f3d93cb91debe5ff')
sha256sums_x86_64=('1940aa718f2a108c67e0822152accda699a4adf7ca7b7f5309f7104fc760a5cf')
install=${_pkgname}.install

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
