# Maintainer: Mathijs Verhaegh <mathijs@verhaegh.nl>

pkgname=openscad-snapshot-appimage
pkgver=2025.06.02.ai25565
pkgrel=1
pkgdesc="The Programmers Solid 3D CAD Modeller (Snapshot AppImage version)"
arch=('x86_64')
url="https://www.openscad.org/"
license=('GPL')
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
  'b9a90025cd50b60e41410d9862d42754e7241be8f3ad0048c536a3b47659e245'
  '6b04a62bc4a414a0e94a49de1024ed054c1bc117c553d90cbb57c24d7999ae48'
  '9839be1ae8e9203798713b2d0377d265354f4c5d70fc457c3ff6f015e0e5f56d'
)

package() {
  install -Dm755 "OpenSCAD-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/${pkgname}/openscad.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/openscad.AppImage" "${pkgdir}/usr/bin/openscad"
  install -Dm644 "${srcdir}/openscad.desktop" "${pkgdir}/usr/share/applications/openscad.desktop"
  install -Dm644 "${srcdir}/openscad.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openscad.png"
}
