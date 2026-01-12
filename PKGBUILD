# Maintainer: yumi

pkgname=shvspy-bin
pkgver=1.13.45
pkgrel=1
pkgdesc="SHV Spy (AppImage)"
arch=('x86_64')
url="https://github.com/silicon-heaven/shvspy"
license=('MIT')
depends=('glibc' 'fuse2')
provides=('shvspy')
conflicts=('shvspy')
options=(!strip)

_appimage="shvspy-qt6-${pkgver}.AppImage"

source=(
  "${_appimage}::https://github.com/silicon-heaven/shvspy/releases/download/${pkgver}/${_appimage}"
  "shvspy.png"
  "shvspy.sh"
  "shvspy.desktop"
)

sha256sums=('8d91ca024e4eb6e3c1fd1b1a16d207d243b019b5ff45330a09af900b27f03c6d'
            '785183a3abf7d60bc1e37a4661cddcd2dbcf8451e465c83f705c6df007116fc4'
            'a7a2e367dee84b4bd22bfc4aca237373c2a11f74bee28fdc4a327303d2b0a4c5'
            '78fb4ff4cef729f40d6729bb8f7788868e26d41dd6d26feddbfebb7a958dcb1c')

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/shvspy.AppImage"
  install -Dm755 "${srcdir}/shvspy.sh" "${pkgdir}/usr/bin/shvspy"
  install -Dm644 "${srcdir}/shvspy.png" "${pkgdir}/usr/share/pixmaps/shvspy.png"
  install -Dm644 "${srcdir}/shvspy.desktop" "${pkgdir}/usr/share/applications/shvspy.desktop"
}
