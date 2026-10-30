# Maintainer: orlfman <25542856+orlfman@users.noreply.github.com>

pkgname=plasma6-themes-steamos-vapor-fixed
_reponame=steamos-vapor-plasma-6.8
pkgver=1.0.3
pkgrel=1
pkgdesc="SteamOS Vapor and VGUI themes for KDE Plasma, fixed for Plasma 6.8, with GTK 3/4, Konsole, Alacritty and kitty colors"
arch=('any')
url="https://github.com/orlfman/$_reponame"
license=('GPL-2.0-or-later')
depends=('plasma-workspace' 'breeze')
optdepends=('aurorae: Plastik window decoration for VGUI'
            'oxygen-cursors: KDE_Classic cursor for VGUI'
            'konsole: Vapor Konsole profile'
            'alacritty: Vapor Alacritty colors'
            'kitty: Vapor kitty colors')
conflicts=('plasma6-themes-vapor-steamos' 'plasma5-themes-vapor-steamos' 'steamdeck-kde-presets')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5731bd432594572ce02954b3189349e94447866ccd9a4c66e0a725978c5d5512')

package() {
  cd "$_reponame-$pkgver"
  cp -r --no-preserve=ownership usr "$pkgdir/"
  install -Dm644 alacritty/vapor.toml "$pkgdir/usr/share/alacritty/themes/steamos-vapor.toml"
  install -Dm644 kitty/vapor.conf "$pkgdir/usr/share/kitty/themes/steamos-vapor.conf"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGES.txt GTK3.md gtk4port.md
}
