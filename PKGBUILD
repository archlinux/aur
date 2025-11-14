pkgname=cinnamon-mint
pkgver=2.0
pkgrel=2
pkgdesc="Linux Mint's Cinnamon for Arch Linux"
arch=('any')
license=('GPL2')
depends=(
  'cinnamon'
  'cinnamon-translations'
  'mint-themes'
  'mint-themes-legacy'
  'mint-x-icons'
  'mint-y-icons'
  'mintstick'
  'mint-artwork'
  'mintwelcome'
  'mintlocale'
  'nemo'
  'nemo-fileroller'
  'cinnamon-control-center'
  'gnome-terminal'
  'noto-fonts'
)
source=(
  'mint-defaults.gschema.override'
  '00_mint-terminal'
)
sha256sums=('SKIP' 'SKIP')
install=cinnamon-mint.install

package() {
  # GSettings defaults for Cinnamon (Mint-Y-Dark etc)
  install -Dm644 "$srcdir/mint-defaults.gschema.override" \
    "$pkgdir/usr/share/glib-2.0/schemas/99_mint_cinnamon.gschema.override"

  # System-wide dconf defaults for GNOME Terminal (Mint profile)
  install -Dm644 "$srcdir/00_mint-terminal" \
    "$pkgdir/etc/dconf/db/local.d/00_mint-terminal"
}
