# Maintainer: Mehad <mehad605@example.com>
pkgname=dev-type-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Master touch typing while coding (AppImage)"
arch=('x86_64')
url="https://github.com/mehad605/dev_type"
license=('CC-BY-NC-SA-4.0')
depends=('fuse2' 'zlib' 'glibc')

source=(
  "https://github.com/mehad605/dev_type/releases/download/v1.0.0/dev_type-1.0.0-x86_64.AppImage"
  "dev_type.png::https://raw.githubusercontent.com/mehad605/dev_type/v1.0.0/assets/icon.png"
)
sha256sums=(
  '598e49fc82733ed7571b32a7fff7b1c3f289d7955852206a758e2f28c14f97c5'
  'a326e6355f522857545036ac88825042ba1f22e750c2638029856fc7347b3188'
)

package() {
  install -Dm755 "dev_type-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/dev_type"

  install -Dm644 "${srcdir}/dev_type.png"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dev_type.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/dev_type.desktop" <<'EOF2'
[Desktop Entry]
Name=Dev Type
Exec=dev_type
Icon=dev_type
Type=Application
Categories=Education;
Comment=Master touch typing while coding
Terminal=false
EOF2
}
