# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gotz"
pkgname="${_pkgname}-bin"
pkgver=0.1.10
pkgrel=1
pkgdesc="A simple CLI timezone info tool"
arch=('x86_64' 'aarch64')
url="https://github.com/merschformann/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64")
sha256sums=('3d4c6c0eb3801905d7e970d1f59596e91cfce6e74f8ac2e14ed03168f52228be'
            'a9ccb268af303bba78392743f2a6025e23506f52cb1b472b2d52345198aafd88')
sha256sums_x86_64=('f61722aeb5c678532cf4e859ae6bde65e3467dbdcdafe9af374cfd4c509a760b')
sha256sums_aarch64=('ca10dc4cbf77eb371dd017e4534ae84c0396148b427826a140686bd0eb1836ed')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
