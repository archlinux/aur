# Maintainer: Dan Ross <danross2683@gmail.com>

pkgname=notepad-plus-plus-linux-bin
_pkgname=notepad-plus-plus-linux
pkgver=1.2.0
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
  '0127fe07a801f0c5f95698f2322cbbbd7e86c1e18ea56bd858b765c717a4a562'
  '2b94f58d89424af06d1a8e16775774757f1ecfb678203c3439af037a24f35dc6'
)

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/usr" "${pkgdir}/usr"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
