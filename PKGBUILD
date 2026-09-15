# Maintainer: PoDiax <pd@pdx.ovh>
pkgname=waycord-bin
_pkgname=waycord
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight Discord voice overlay for Linux (precompiled binary)"
arch=('x86_64')
url="https://github.com/podiax/waycord"
license=('MIT')
depends=('libx11' 'fontconfig' 'hicolor-icon-theme')
provides=('waycord')
conflicts=('waycord' 'waycord-git')
source=("https://github.com/podiax/waycord/releases/download/v${pkgver}/waycord-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('95de13e3331a509f1e45e0f8df452074a1876149d495c522bff46436e91262d9')

package() {
  cd "$srcdir/waycord-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "waycord" "$pkgdir/usr/bin/waycord"
  install -Dm644 "assets/waycord.desktop" "$pkgdir/usr/share/applications/waycord.desktop"
  install -Dm644 "assets/waycord.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/waycord.svg"
  install -Dm644 "assets/waycord.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/waycord.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
