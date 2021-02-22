# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.me>
# Past Maintainer: Emerson Almeida <duke.m16@gmail.com>
# Past Contributor: Emerson Almeida <duke.m16@gmail.com>

pkgname=zoho-mail-desktop
pkgver=1.1.12
pkgrel=2
pkgdesc="The desktop version of your favorite mailsuite!"
arch=('x86_64')
license=('custom')
url="https://www.zoho.com/mail/"
options=()

sha256sums=('fb4e7e60f1e06ebb6d3d285e380da7251f74c97b6bc786635648e73fd2cf4762')
source=("https://downloads.zohocdn.com/zmail-desktop/linux/zoho-mail-desktop-x64-v${pkgver}.AppImage")

prepare() {
  chmod +x zoho-mail-desktop-x64-v${pkgver}.AppImage
  ./zoho-mail-desktop-x64-v${pkgver}.AppImage --appimage-extract
  }

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -R "${srcdir}/squashfs-root/" "${pkgdir}/opt/${pkgname}"
  chmod -R 755 "${pkgdir}/opt/${pkgname}"
  
  mkdir -p "${pkgdir}/usr/share/"
  cp -R "${srcdir}/squashfs-root/usr/share/icons/" "${pkgdir}/usr/share/"
  
  mkdir -p "${pkgdir}/usr/share/applications/"
  cp "../zoho-mail-desktop.desktop" "${pkgdir}/usr/share/applications/"
  }
  
