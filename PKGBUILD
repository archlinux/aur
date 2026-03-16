# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="hyprlax"
pkgname="${_pkgname}-bin"
pkgver=2.2.2
pkgrel=1
pkgdesc="Smooth parallax wallpaper animation for Hyprland and other Wayland compositors"
arch=(
  'x86_64'
)
url="https://hyprlax.com"
_url="https://github.com/sandwichfarm/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libegl'
  'libgles'
  'wayland'
  'wayland-compositor'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64"
)
sha256sums=('6e6ed94b2d854d1f427f5a9500ea181d6c6fe7096ee2ce9eabc73587598bef86'
            'e06c07a47e2d429d3f8d53abd583e674b317636b4a41e3dbe3bda05d176daa9f'
            'b16d69c52429a8d8e94aae4b365d7b9618977a18eae187a4142c97f0170731e6')
sha256sums_x86_64=('31925a1d6f24844084b2de3aa8dce36b79c2e638a0b3904803e36a83e326568f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"     "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
