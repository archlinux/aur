# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="envman"
pkgname="${_pkgname}-bin"
pkgver=2.5.3
pkgrel=1
pkgdesc="Manage Environment Variable collections"
arch=('aarch64' 'x86_64')
url="https://github.com/bitrise-io/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-arm64")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-x86_64")
sha256sums=('3006e07e1922e1714966fdb0846a327cc17ff0eac152edb5df4a3a45e2d60aca'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
sha256sums_aarch64=('3d36ac54b15adf8feaf2ec40cf20b55cf1d43f8472534ca5124f6b602a6fb602')
sha256sums_x86_64=('a690af0d72cc477219fa85c6d9a1ed34904da681552ae99cbae75cf35009a0fe')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
