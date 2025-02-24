# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aaaaxy"
pkgname="${_pkgname}-bin"
pkgver=1.6.0
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
b2sums=('7a5b2abd80f1c1468a129e3d766d66d2edbd058d70a00f9afe224162eaba61732028d18f50dd0b6348ee187d8a36b62cc3043af86c53b5cc9b8a6b6baf677f3e'
        '7a8922bcca8de0efa70d6a922fe549be0380b224eb0e1bc4f8d94550bafe1c98347c905b73acc9f894590f1aaba2ccd5c05d969e6a690aec050b3162566d8cc9'
        '6be6c260d3225ebae25c393ed82020572febaeed081d9e96fcf0723640f753b956199d22e432e67d2eebccf72dcc84a80c3a990d2b88370f6277ab0f655fce65'
        'd2c5b31ffd07d946c2cb677bd0a364582db4e1d13cb12e5a84fd76448d2de599a3700e3f9b5092c7446c790f8d26b8f7060387e2694b65318afc835c03490a09')
b2sums_x86_64=('38b2cc575cfc6c320fa4a341dcfdc16baee9565a41270f39a3bcd7f4a32fde67486dcdf2579b3d7a5d7bfa505128a439d5de5d928bb669dcd0faf08966263f0b')

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
