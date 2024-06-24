# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=stepman
pkgname=${_pkgname}-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Manage decentralized StepLib Step (script) collections"
arch=('x86_64' 'aarch64')
url="https://github.com/bitrise-io/${_pkgname}"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/${pkgver}/README.md"
        "${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}::${url}/releases/download/${pkgver}/${_pkgname}-Linux-x86_64")
source_aarch64=("${_pkgsrc}::${url}/releases/download/${pkgver}/${_pkgname}-Linux-arm64")
sha256sums=('a6f4e5eef34a61a1fe87cbc06109bf3d077b9eb7fa945d70c95c5643dea9ed0c'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
sha256sums_x86_64=('fc65a04eb9cc9d1f48b4b426fff75ec433ed2ca9c7babd05bcb5892a5a6cc83b')
sha256sums_aarch64=('bf8809cdd565c55ae7868db121181f817e16cbf4de88a5767a1f55dbdc0025ba')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
