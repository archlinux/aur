# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aaaaxy"
pkgname="${_pkgname}-bin"
pkgver=1.5.220
pkgrel=1
pkgdesc="A nonlinear puzzle platformer taking place in impossible spaces"
arch=('x86_64')
url="https://github.com/divVerent/${_pkgname}"
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'hicolor-icon-theme' 'libx11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.desktop::${url}/raw/v${pkgver}/${_pkgname}.desktop"
        "${_pkgsrc}.png::${url}/raw/v${pkgver}/${_pkgname}.png"
        "${_pkgsrc}.svg::${url}/raw/v${pkgver}/${_pkgname}.svg"
        "io.github.divverent.${_pkgsrc}.metainfo.xml::${url}/raw/v${pkgver}/io.github.divverent.${_pkgname}.metainfo.xml")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v${pkgver}.zip")
b2sums=('7a5b2abd80f1c1468a129e3d766d66d2edbd058d70a00f9afe224162eaba61732028d18f50dd0b6348ee187d8a36b62cc3043af86c53b5cc9b8a6b6baf677f3e'
        '7a8922bcca8de0efa70d6a922fe549be0380b224eb0e1bc4f8d94550bafe1c98347c905b73acc9f894590f1aaba2ccd5c05d969e6a690aec050b3162566d8cc9'
        '6be6c260d3225ebae25c393ed82020572febaeed081d9e96fcf0723640f753b956199d22e432e67d2eebccf72dcc84a80c3a990d2b88370f6277ab0f655fce65'
        '0bd20845464e5989eaf87856cac1c7aedfdb9de5e752bb703fec5ae097d581d121f44d710e41498575fd8e20449a6f1a1142810522ecceb2fe140494a2bcd20a')
b2sums_x86_64=('38c8578b015e1061380beadc95cdebed99c9bbdf1b5d1a645139f0cbae69de073edf670287ce340328ffdd2d3806f306e6ddfa2fef3c2074df79788b8113bdda')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}-linux"* "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgsrc}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -Dm644 "${_pkgsrc}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -Dm644 "${_pkgsrc}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "io.github.divverent.${_pkgsrc}.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.divverent.${_pkgname}.metainfo.xml"
}
