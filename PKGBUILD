# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="envman"
pkgname="${_pkgname}-bin"
pkgver=2.5.2
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
sha256sums_aarch64=('029ee2bfd751d7a08a1ccc2fb8a21e7d66d570ad434d4bc03cbc3c370c91f1b6')
sha256sums_x86_64=('ce39f4e5c83eecacdf958be987bb4873c9b58f606839f40f7f12322f03fd743a')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
