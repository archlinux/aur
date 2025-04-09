# Maintainer: sonofaglitch <sonofaglitch@mailbox.org>
pkgname=ahk_x11-bin
pkgver=1.0.5
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
sha512sums=('858b7e21577dbac09a58f7cdad48a5375b04bd94e784dfd4f39c5d61297e8a19883e0b6c2b497c28dfcd430839d1c0a6f6522d197b740db9ecb072683ce73063' '11db4f837142d54fcd1a177fca3efe531c186c312bf10a98bf06ae70227f747b2bfb2484d999bfc4ebe29a1d471d97d014d637505ba7ee627762a5a434710471')
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
