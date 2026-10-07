pkgname=legio-launcher-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Legio desktop game launcher'
arch=('x86_64')
url='https://github.com/fraa2a/Legio'
license=('custom')
depends=('fuse2' 'umu-launcher' 'xdg-utils' 'desktop-file-utils')
provides=('legio-launcher')
conflicts=('legio-launcher')
options=('!strip')
source=("Legio-${pkgver}.AppImage::https://github.com/fraa2a/Legio/releases/download/v0.2.0/Legio.Launcher_0.2.0_amd64.AppImage" "icon.png::https://raw.githubusercontent.com/fraa2a/Legio/v${pkgver}/src-tauri/icons/icon.png" 'legio-launcher' 'legio-launcher.desktop' 'LICENSE')
sha256sums=('2a02dfd71bc744d31a4aaed993653bc27268db37c1384e70026e2a6f748c9bfb' '90c37c62e8de273897ec1c96e1d00847c27cb19b685f8eb0e5e5309e685eb495' '09ee16ce55c31ebbfec8e7753564a7d342944b0c68a999355ec65029710d2871' 'b60b83844458475f90d93ab0b6a37f7d16cfb897945feaff82e2cf83f2a65333' 'b86297b73f6613f615f32cd23c31ace1b23d409b2007c9930f2f252dccc97a5b')

package() {
  install -Dm755 "$srcdir/Legio-${pkgver}.AppImage" "$pkgdir/opt/legio-launcher/Legio.AppImage"
  install -Dm755 "$srcdir/legio-launcher" "$pkgdir/usr/bin/legio-launcher"
  install -Dm644 "$srcdir/legio-launcher.desktop" "$pkgdir/usr/share/applications/legio-launcher.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/legio-launcher.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
