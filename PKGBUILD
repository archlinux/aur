pkgname=discerns
pkgver=0.1.22
pkgrel=1
pkgdesc="Cross-database desktop studio built with Tauri"
arch=('x86_64')
url="https://github.com/broisnischal/studio"
license=('custom')
depends=('fuse2')
options=(!strip)

source=("${pkgname}-${pkgver}.AppImage::https://github.com/broisnischal/studio/releases/download/v${pkgver}/db-studio_${pkgver}_amd64.AppImage")
sha256sums=('7214b7bd75519a191898b7f124c4667f358bef61b65f6b43b34baa06e51cf10d')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/discerns/discerns.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/discerns" <<'EOF'
#!/usr/bin/env sh
exec /opt/discerns/discerns.AppImage "$@"
EOF
}
