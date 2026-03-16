# Maintainer: Javad <ja7ad@live.com>
# This package is based on PKGBUILD from Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=postman-live-bin
pkgver=12.2.0
pkgrel=1
pkgdesc="Build, test, and document your APIs faster (Live version)"
provides=('postman')
conflicts=('postman')
arch=('x86_64' 'aarch64')
url="https://www.getpostman.com"
options=(!strip)
license=('custom')
depends=('libcups' 'systemd-libs' 'libxfixes' 'libx11' 'cairo' 'nspr' 'hicolor-icon-theme' 'bash' 'at-spi2-core' 'expat' 'libxkbcommon' 'glib2' 'pango' 'libxcomposite' 'mesa' 'nss' 'gcc-libs' 'gtk3' 'libxrandr' 'libdrm' 'libxcb' 'libxext' 'alsa-lib' 'libxdamage' 'dbus' 'libsecret' 'glibc')

source=("postman.desktop")
source_x86_64=("postman-${pkgver}-linux-x64.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux64")
source_aarch64=("postman-${pkgver}-linux-arm64.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux_arm64")

package() {
  install -dm755 "${pkgdir}/opt/"
  cp -r "Postman" "${pkgdir}/opt/postman"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/postman/Postman" "${pkgdir}/usr/bin/postman"

  # Desktop file
  install -D -m644 "postman.desktop" "${pkgdir}/usr/share/applications/postman.desktop"

  # Icon
  install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  ln -s "/opt/postman/app/resources/app/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/postman.png"
}

sha256sums=('b6db7367b16338b10c93e22304bb06724b844389136ee542e1f28366010a279c')
sha256sums_x86_64=('6b309ecd621075cbd9ea95811a5b16d6b39f005767ab719e607ea7ed59bb1853')
sha256sums_aarch64=('248100b90db688d7b69f2a27f7831df7f04d641a1a2074272c606ecd8b129f9c')
