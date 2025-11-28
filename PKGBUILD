# Maintainer: Mathijs Verhaegh <mathijs@verhaegh.nl>

pkgname=openscad-snapshot-appimage
pkgver=2025.11.27.ai29484
pkgrel=1
pkgdesc="The Programmers Solid 3D CAD Modeller (Snapshot AppImage version)"
arch=('x86_64')
url="https://www.openscad.org/"
license=('GPL2')
depends=('fuse2')
provides=('openscad')
conflicts=('openscad')
options=(!strip)

source=(
  "OpenSCAD-${pkgver}-x86_64.AppImage::https://files.openscad.org/snapshots/OpenSCAD-${pkgver}-x86_64.AppImage"
  "openscad.desktop"
  "openscad.png::https://openscad.org/assets/img/logo.png"
)
sha256sums=(
  '8c34b78d67e5d112c074eb71bb25164a89977aff0ea0b57b2e1b5e153b14f015'
  '75f0c029b6bfc37576f6875443e30d8e1cac0cfbf9be0673c5e1a23849200f3c'
  '9839be1ae8e9203798713b2d0377d265354f4c5d70fc457c3ff6f015e0e5f56d'
)

package() {
  install -Dm755 "OpenSCAD-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/${pkgname}/openscad.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/openscad.AppImage" "${pkgdir}/usr/bin/openscad"
  install -Dm644 "${srcdir}/openscad.desktop" "${pkgdir}/usr/share/applications/openscad.desktop"
  install -Dm644 "${srcdir}/openscad.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openscad.png"
}

