# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.me>
# Past Maintainer: Emerson Almeida <duke.m16@gmail.com>
# Past Contributor: Emerson Almeida <duke.m16@gmail.com>

pkgname=zoho-mail-desktop
pkgver=1.2.0
pkgrel=2
pkgdesc="The desktop version of your favorite mailsuite!"
arch=('x86_64')
license=('custom')
url="https://www.zoho.com/mail/"
options=()

sha256sums=('106801eba31665f806dda8d78ad192b6464e69c85a041d08937433b4e74f19cb')
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
  
