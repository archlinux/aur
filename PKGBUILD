# Maintainer: Dan Ross <danross2683@gmail.com>

pkgname=notepad-plus-plus-linux-bin
_pkgname=notepad-plus-plus-linux
pkgver=1.0.0
pkgrel=1
pkgdesc='Linux-native Notepad++ fork for Arch Linux and derivatives (prebuilt binary)'
arch=('x86_64')
url='https://github.com/RossEngineering/notepad-plus-plus-linux'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-5compat' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
provides=('notepad-plus-plus-linux')
conflicts=('notepad-plus-plus-linux')
install='notepad-plus-plus-linux-bin.install'
source=(
  "${_pkgname}-v${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64.tar.xz"
  "LICENSE::https://raw.githubusercontent.com/RossEngineering/notepad-plus-plus-linux/v${pkgver}/LICENSE"
)
sha256sums=(
  '074d898a7dad254e4b3e4bc6004273d4994f0991b454f208a49e9553c9f9cfb6'
  '2b94f58d89424af06d1a8e16775774757f1ecfb678203c3439af037a24f35dc6'
)

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/usr" "${pkgdir}/usr"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
