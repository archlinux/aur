# Maintainer: sonofaglitch <sonofaglitch@mailbox.org>
pkgname=ahk_x11-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="AutoHotkey for Linux."
arch=('x86_64')
conflicts=('ahk_x11-git' 'ahk_x11')
url="https://github.com/phil294/AHK_X11"
license=('GPL-2.0')
depends=('xorg-server' 'fuse2')
makedepends=('coreutils')
options=('!debug' '!strip')
provides=('ahk_x11')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/${pkgver}.tar.gz" ${pkgname}-${pkgver}.AppImage::"https://github.com/phil294/AHK_X11/releases/download/${pkgver}/${pkgname/-bin/}.AppImage")
sha512sums=('a3bc9abe55a1cef65796a0a6f894617bc120f5c0a310220d6e1bbc8ff35fde885ea35c6689871ceca03848c424551e0b0061065e0c9d1f3344498033a26695c1' 'f2abd9d5fbbd788638acdd01b9e2654aa56fb7b98d384fec3b5dcbf2540c8f2ee45d5cf7248afe18d3c4b133e517024178461a50b7b168d3a322a7a75161608d')
package() {
  mkdir -p ${pkgdir}/usr/bin
  install -D ${srcdir}/${pkgname}-${pkgver}.AppImage ${pkgdir}/usr/bin/ahk_x11
  mkdir -p ${pkgdir}/usr/share/{applications,mime/packages}
  install -D -m 0644 ${srcdir}/AHK_X11-${pkgver}/assets/ahk_x11.png ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-ahk_x11.png
  install -D -m 0644 ${srcdir}/AHK_X11-${pkgver}/assets/ahk_x11-mime.xml ${pkgdir}/usr/share/mime/packages/
  install -D -m 0644 ${srcdir}/AHK_X11-${pkgver}/assets/ahk_x11.desktop ${pkgdir}/usr/share/applications/
  install -D -m 0644 ${srcdir}/AHK_X11-${pkgver}/assets/ahk_x11-compiler.desktop ${pkgdir}/usr/share/applications/
  install -D -m 0644 ${srcdir}/AHK_X11-${pkgver}/assets/ahk_x11-windowspy.desktop ${pkgdir}/usr/share/applications/
}
