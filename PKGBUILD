# Maintainer: kneesdev <kneesdev@naver.com>
pkgname=duelsplus-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="Lightweight, custom Minecraft Proxy designed to enhance your experience on Hypixel Duels."
arch=('x86_64')
url="https://duelsplus.com"
license=('MIT')
depends=('fuse2')
# these are included for future compatibility with a potential source-built 'duelsplus' package
# currently they don't affect anything
provides=('duelsplus')
conflicts=('duelsplus')
source=(
  "Duels+-${pkgver}-x64.AppImage::https://launcher-updates.duelsplus.com/download/flavor/default/${pkgver}/linux_64/Duels%2B-${pkgver}-x64.AppImage"
  "duelsplus.desktop"
  "duelsplus.png"
)
sha256sums=('9615fdb4cd08f93087bad44ba9759a0f8d0abff243c10cd76915ca5038666c40'
            'd8faeec892e05d62e57de71e9ac92ca7d247a6c7be8d57c2d71908ca118441c0'
            '1da7bc1fa20f6811e584b50c84dbb8a8d1d1a2a482df6e367052d8a3fff43b53')

package() {
  install -dm755 "${pkgdir}/opt/duelsplus"
  cp -a "Duels+-${pkgver}-x64.AppImage" "${pkgdir}/opt/duelsplus/duelsplus.AppImage"
  chmod 755 "${pkgdir}/opt/duelsplus/duelsplus.AppImage"
  install -Dm644 "duelsplus.desktop" "${pkgdir}/usr/share/applications/duelsplus.desktop"
  install -Dm644 "duelsplus.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/duelsplus.png"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/duelsplus/duelsplus.AppImage" "${pkgdir}/usr/bin/duelsplus"
}
