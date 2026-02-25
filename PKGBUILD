# Maintainer: sonofaglitch <sonofaglitch@mailbox.org>
pkgname=ahk_x11-bin
pkgver=1.0.7
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
sha512sums=('3c136b14b1f3f2935a760207e8ef424b1af3b3dee9ff416d72e431398a5b1ffb660937627be7360562e1c17d979b1d3b8d5e84607d94c014969dacf52b2fe512' '3990183cf0bd19d9607f036d1c6fe7a6d6a99f3cb1bc753d5620e1b0915e3f72fad282b551a64d3e38c800e04d75973480337abd9f18ff83f100dc85c8151b7a')
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
