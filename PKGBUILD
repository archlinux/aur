# Maintainer: sonofaglitch <sonofaglitch@mailbox.org>
pkgname=ahk_x11-bin
pkgver=1.0.4
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
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/${pkgver}.tar.gz" ${pkgname}-${pkgver}.AppImage::"${url}/releases/download/${pkgver}/${pkgname/-bin/}.AppImage")
sha512sums=('0227310b3c730bec3e077701c192c2e938cadf66b6975e4a995f96a9ebb7f132e0529237dfdbf7247e662f775da48763806123f051a0d8eb3a39dd49f2043a22' '3a346774822ce686af9e107459935184e31f3e17722deaabc3d5e5d583f8dc6ae0a49b814029c03e76685ffe4d4443446ebe438e9479d0c0a2e3778b93c9c56e')
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
