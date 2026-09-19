# Maintainer: PoDiax <pd@pdx.ovh>
pkgname=waycord-bin
_pkgname=waycord
pkgver=0.1.2
pkgrel=1
pkgdesc="Lightweight Discord voice overlay for Linux"
arch=('x86_64')
url="https://github.com/podiax/waycord"
license=('MIT')
depends=('libx11' 'fontconfig' 'hicolor-icon-theme')
provides=('waycord')
conflicts=('waycord' 'waycord-git')
source=("https://github.com/podiax/waycord/releases/download/v${pkgver}/waycord-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('b23cc2cc7945699e5e49a574978dced80456dd9abe4efe6782810719448c53da')

package() {
  cd "$srcdir/waycord-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "waycord" "$pkgdir/usr/bin/waycord"
  install -Dm644 "assets/waycord.desktop" "$pkgdir/usr/share/applications/waycord.desktop"
  install -Dm644 "assets/waycord.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/waycord.svg"
  install -Dm644 "assets/waycord.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/waycord.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
