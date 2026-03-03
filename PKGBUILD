# Maintainer: Sovereign <contact@sovrulez.net>
pkgname=ecliypse-bin
_pkgname=ecliypse
pkgver=2.0.3
pkgrel=2
pkgdesc="High-performance game launcher and downloader"
arch=('x86_64')
url="https://ecliypse.com"
license=('custom:commercial')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libappindicator-gtk3'
  'librsvg'
  'libsecret'
  'hicolor-icon-theme'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

source=("${_pkgname}.desktop"
        "${_pkgname}.nvidia.desktop"
        "https://s3.lillianne.solutions/aur/${_pkgname}-${pkgver}.tar.gz")

sha256sums=('5db70863de4d1bfe8c3cde5fad073239a3d12479ee187734361eadff32f45f7a'
            'cdf6993a2dc593d882da4ad82840ecb471583fb763bb138d402a8728de0362eb'
            'ac97defdc650ca20fbc40944327e2094707815101751dd31ab3617d2129819d8')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.nvidia.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.nvidia.desktop"
}
