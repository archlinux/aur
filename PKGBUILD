pkgname=evolve-core-bin
pkgver=1.7
pkgrel=1
pkgdesc="Modern GTK Theme Manager for GNOME (binary release)"
arch=('x86_64')
url="https://github.com/arcnations-united/evolve-core"
license=('Apache-2.0 license')
depends=('gtk4' 'webkit2gtk' 'libadwaita')
source=(
  "https://github.com/arcnations-united/evolve-core/releases/download/v${pkgver}/EvolveCore-v${pkgver}.zip"
  "evolve-core.desktop"
)
sha256sums=('SKIP' 'SKIP')

package() {
  install -d "$pkgdir/opt/evolve-core"
  bsdtar -xf "EvolveCore-v${pkgver}.zip" -C "$pkgdir/opt/evolve-core"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/evolve-core/evolvecore" "$pkgdir/usr/bin/evolve-core"
  install -Dm644 "evolve-core.desktop" "$pkgdir/usr/share/applications/evolve-core.desktop"
  install -Dm644 "$pkgdir/opt/evolve-core/iconfile.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/evolve-core.png"
}
