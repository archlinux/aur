# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aaaaxy"
pkgname="${_pkgname}-bin"
pkgver=1.6.257
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
        '3d3bd055993209022f3ad4fadd256f89f44a2832d746bc7d1ee48b342c97465d8e7aa9daf6fb489edd079594f7b1405c22e238eed012042000c3b892406cded4')
b2sums_x86_64=('19ef29ad7e5604d23ba1cbccfe2ebc23863970388f799b714f976fbdd24c82342ee8545953cfcaa57b3aa84138a8da2a03f23b41e68b89ce9f869ef346313b53')

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
