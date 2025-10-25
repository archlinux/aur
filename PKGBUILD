# Maintainer: kneesdev <kneesdev@naver.com>
pkgname=duelsplus-bin
pkgver=2.3.2
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
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -dm755 "${pkgdir}/opt/duelsplus"
  cp -a "Duels+-${pkgver}-x64.AppImage" "${pkgdir}/opt/duelsplus/duelsplus.AppImage"
  chmod 755 "${pkgdir}/opt/duelsplus/duelsplus.AppImage"
  install -Dm644 "duelsplus.desktop" "${pkgdir}/usr/share/applications/duelsplus.desktop"
  install -Dm644 "duelsplus.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/duelsplus.png"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/duelsplus/duelsplus.AppImage" "${pkgdir}/usr/bin/duelsplus"
}
