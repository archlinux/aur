# Maintainer: orlfman <25542856+orlfman@users.noreply.github.com>

pkgname=plasma6-themes-steamos-vapor-fixed
_reponame=steamos-vapor-plasma-6.8
pkgver=1.0.4
pkgrel=1
pkgdesc="SteamOS Vapor and VGUI themes for KDE Plasma, fixed for Plasma 6.8, with GTK 3/4, native libadwaita, Konsole, Alacritty and kitty colors"
arch=('any')
url="https://github.com/orlfman/$_reponame"
license=('GPL-2.0-or-later')
depends=('plasma-workspace' 'breeze' 'python' 'gtk4>=4.24' 'libadwaita>=1.10')
optdepends=('aurorae: Plastik window decoration for VGUI'
            'oxygen-cursors: KDE_Classic cursor for VGUI'
            'konsole: Vapor Konsole profile'
            'alacritty: Vapor Alacritty colors'
            'kitty: Vapor kitty colors')
conflicts=('plasma6-themes-vapor-steamos' 'plasma5-themes-vapor-steamos' 'steamdeck-kde-presets')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f918d4b9762d2bb580a63e6655cb84886b74ecf4386ba1c11eec0c50d1ca6b44')

package() {
  cd "$_reponame-$pkgver"
  python3 -I tools/stage-package.py --destdir "$pkgdir"
}
