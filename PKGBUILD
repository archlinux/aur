# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="TempleDriver"
_pkgname="${_binname,,}"
pkgname="${_pkgname}-bin"
pkgver=1.0
pkgrel=1
pkgdesc="A driving game dedicated to King Terry A. Davis"
arch=('x86_64')
url="https://github.com/mrbid/${_binname}"
license=('Unlicense')
depends=('hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/${pkgver}/README.md"
        "LICENSE-${pkgver}.md::${url}/raw/${pkgver}/LICENSE.md"
        "${_pkgsrc}.desktop::${url}/raw/${pkgver}/flat/${_pkgname}.desktop"
        "${_pkgsrc}.appdata.xml::${url}/raw/${pkgver}/flat/${_pkgname}.appdata.xml"
        "${_pkgsrc}.png::${url}/raw/${pkgver}/flat/${_pkgname}.png")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_binname}")
sha256sums=('6e7718c42707aee26c3ee595fa37bfb896f08e6c950497954d82721fa2768ed5'
            '88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd'
            '58d8c13c64e8af44a4771235dee4650b05c43b4da0aac65599adb032034900fd'
            '0c27dfe0ddb74287048bc7bb373cf5e417deb1346f39090cfb03a97aac821120'
            'e410469f13de9ef40636d7b893cc30e5b8c5441924bfa2f745bc545a8ec37b38')
sha256sums_x86_64=('f68c705ee96065488f7d537213d913fd21fd734bfacbbe2442f5703b80e0c892')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"

  install -Dm644 "${_pkgsrc}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgsrc}.appdata.xml" "${pkgdir}/usr/share/metainfo/${_pkgname}.appdata.xml"
  install -Dm644 "${_pkgsrc}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
