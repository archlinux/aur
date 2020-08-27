# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
_projname=wstunnel
_pkgname=haskell-"${_projname}"
pkgname="${_pkgname}"-bin
pkgver=3.0
pkgrel=1
pkgdesc="Tunneling over websocket protocol"
arch=('x86_64')
url="https://github.com/erebe/wstunnel"
license=('BSD')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'nodejs-wstunnel')
source=("${pkgname}-${pkgver}.zip::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-x64-linux.zip"
        "${pkgname}-${pkgver}-LICENSE::https://github.com/erebe/${_projname}/raw/v${pkgver}/LICENSE"
        "${pkgname}-${pkgver}-README.md::https://github.com/erebe/${_projname}/raw/v${pkgver}/README.md"
        "${pkgname}-${pkgver}-logo.png::https://github.com/erebe/${_projname}/raw/v${pkgver}/logo_${_projname}.png")
sha256sums=('040b3d6d98b8d3ff0df2ba05b6b89e8a6820be981ffe4a3b39af563225f66098'
            'eaea4f8a2ebca92e3ca13f77d01364b110723c70ed6370ce1ecdb4f84261d411'
            'c408ac4b73b05052357f6a598b961f9fb73ddc29df296febdf06842ceaaa6422'
            'e193de98502986dfb54639058b1409e92282f78b54d04b0d2735d4b4c9be2b77')

prepare() {
  sed -i "s|https://github.com/erebe/${_projname}/raw/master/logo_${_projname}.png|logo.png|g" "${pkgname}-${pkgver}-README.md"
}

package() {
  install -Dm755 "${_projname}" "${pkgdir}/usr/bin/${_projname}"
  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${pkgname}-${pkgver}-logo.png" "${pkgdir}/usr/share/doc/${_pkgname}/logo.png"
}
