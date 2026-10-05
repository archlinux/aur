pkgname=legio-launcher-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Legio desktop game launcher'
arch=('x86_64')
url='https://github.com/fraa2a/Legio'
license=('custom')
depends=('fuse2')
provides=('legio-launcher')
conflicts=('legio-launcher')
options=('!strip')
source=("Legio-${pkgver}.AppImage::https://github.com/fraa2a/Legio/releases/download/v0.1.4/Legio.Launcher_0.1.4_amd64.AppImage" "icon.png::https://raw.githubusercontent.com/fraa2a/Legio/v${pkgver}/src-tauri/icons/icon.png" 'legio-launcher' 'legio-launcher.desktop' 'LICENSE')
sha256sums=('b2d08c92e28a4ac5403fe0a4c89ffdb95977f955f769c2f19e47057a15176bb6' '90c37c62e8de273897ec1c96e1d00847c27cb19b685f8eb0e5e5309e685eb495' '09ee16ce55c31ebbfec8e7753564a7d342944b0c68a999355ec65029710d2871' 'ed60edfcf50fc3c44815a68fd1cf97ea069cb6b6187b28888c28cfab8232cb87' 'b86297b73f6613f615f32cd23c31ace1b23d409b2007c9930f2f252dccc97a5b')

package() {
  install -Dm755 "$srcdir/Legio-${pkgver}.AppImage" "$pkgdir/opt/legio-launcher/Legio.AppImage"
  install -Dm755 "$srcdir/legio-launcher" "$pkgdir/usr/bin/legio-launcher"
  install -Dm644 "$srcdir/legio-launcher.desktop" "$pkgdir/usr/share/applications/legio-launcher.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/legio-launcher.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
