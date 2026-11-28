pkgname=legio-launcher-bin
pkgver=1.0.5
pkgrel=1
epoch=1
pkgdesc='Legio desktop game launcher'
arch=('x86_64')
url='https://github.com/fraa2a/Legio'
license=('LicenseRef-Apache-2.0-with-Commons-Clause')
depends=('fuse2' 'umu-launcher' 'xdg-utils' 'desktop-file-utils')
provides=('legio-launcher')
conflicts=('legio-launcher')
options=('!strip')
source=("Legio-${pkgver}.AppImage::https://github.com/fraa2a/Legio/releases/download/v1.0.5/Legio.Launcher_1.0.5_amd64.AppImage" "icon.png::https://raw.githubusercontent.com/fraa2a/Legio/v${pkgver}/src-tauri/icons/icon.png" 'legio-launcher' 'legio-launcher.desktop' 'LICENSE' 'NOTICE' 'THIRD_PARTY_NOTICES.md')
sha256sums=('0ff65f00a922f5157e81b37b9b20e8f5cd197ae9dc55d4d7de1b441e2ac46d85' '90c37c62e8de273897ec1c96e1d00847c27cb19b685f8eb0e5e5309e685eb495' '09ee16ce55c31ebbfec8e7753564a7d342944b0c68a999355ec65029710d2871' 'b60b83844458475f90d93ab0b6a37f7d16cfb897945feaff82e2cf83f2a65333' '72e4221156d855dc680efa0d3d4d66fe48ce72c313552694b5ce76d2a26b5ebf' '27322f29fcdd0a44fb6210641b7798d015a29cc7e0a29316504e843fe2d55ac3' 'b06fe4d009a752ace76b6ced031a0863d683a3e4bee01d81432e91a38b8ebba5')

package() {
  install -Dm755 "$srcdir/Legio-${pkgver}.AppImage" "$pkgdir/opt/legio-launcher/Legio.AppImage"
  install -Dm755 "$srcdir/legio-launcher" "$pkgdir/usr/bin/legio-launcher"
  install -Dm644 "$srcdir/legio-launcher.desktop" "$pkgdir/usr/share/applications/legio-launcher.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/legio-launcher.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 "$srcdir/THIRD_PARTY_NOTICES.md" "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
}
