# Maintainer: CrossScar <crossscar@proton.me>
pkgname=numi-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="Beautiful calculator app for macOS, Linux, and Windows"
arch=('x86_64')
url="https://numi.app"
license=('MIT')
source=("https://s3.numi.app/desktop/v${pkgver}/numi-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

prepare() {
  ./numi_${pkgver}_amd64.AppImage --appimage-extract
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/256x256@2/apps
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/32x32/apps

  cp squashfs-root/usr/bin/numi ${pkgdir}/usr/bin/numi
  cp squashfs-root/usr/share/applications/numi.desktop ${pkgdir}/usr/share/applications/numi.desktop
  cp squashfs-root/usr/share/icons/hicolor/128x128/apps/numi.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/numi.png
  cp squashfs-root/usr/share/icons/hicolor/256x256@2/apps/numi.png ${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/numi.png
  cp squashfs-root/usr/share/icons/hicolor/32x32/apps/numi.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/numi.png
}
