# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aaaaxy"
pkgname="${_pkgname}-bin"
pkgver=1.6.301
pkgrel=1
pkgdesc="A nonlinear puzzle platformer taking place in impossible spaces"
arch=('x86_64')
url="https://github.com/divVerent/${_pkgname}"
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'hicolor-icon-theme' 'libx11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.desktop::${url}/raw/refs/tags/v${pkgver}/${_pkgname}.desktop"
        "${_pkgsrc}.png::${url}/raw/refs/tags/v${pkgver}/${_pkgname}.png"
        "${_pkgsrc}.svg::${url}/raw/refs/tags/v${pkgver}/${_pkgname}.svg"
        "${_pkgsrc}-io.github.divverent.${_pkgname}.metainfo.xml::${url}/raw/refs/tags/v${pkgver}/io.github.divverent.${_pkgname}.metainfo.xml")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v${pkgver}.zip")
sha256sums=('98775b1b9cb0ff5bd34ea320e9010e6a5d460e47eb7fae5d7a3fec5a5d9a9365'
            'd2a371c16ac7ac38030d0aa5bddaad1e2365ab56950c32c88e6915c44114fe4b'
            'dc0e53a341b9d5656f0f0e0ce69d9f99dc5f2c74fe51eb79d5348a41d26b1028'
            '5290ffc70cf4c157e2acce5752bb40863de5c9c3537c149dd70e1aa5605fca84')
sha256sums_x86_64=('cca5bd8710937078e8d6d7282b334f54430b7ef360e5f999bbd108e2c1ea486a')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}-linux"* "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -vDm644 "${_pkgsrc}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -vDm644 "${_pkgsrc}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -vDm644 "${_pkgsrc}-io.github.divverent.${_pkgname}.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.divverent.${_pkgname}.metainfo.xml"
}
