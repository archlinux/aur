# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="envman"
pkgname="${_pkgname}-bin"
pkgver=2.4.3
pkgrel=1
pkgdesc="Manage Environment Variable collections"
arch=('x86_64' 'aarch64')
url="https://github.com/bitrise-io/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/${pkgver}/README.md"
        "${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}::${url}/releases/download/${pkgver}/${_pkgname}-Linux-x86_64")
source_aarch64=("${_pkgsrc}::${url}/releases/download/${pkgver}/${_pkgname}-Linux-arm64")
sha256sums=('8b96a9c7e52244c8eee5e71091fba9227ab08819e5b1520615fa7ae9203265a2'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
sha256sums_x86_64=('575867608de0c1dec1881ee15fe7997096e6aa9e29bfc8fbd6dd171930f2026c')
sha256sums_aarch64=('41d6597022e390bc990b1c608c9684997d51248b37c9b7ebd32c35600166feb2')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
