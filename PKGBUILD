# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=ttop-bin
pkgver=1.5.6
pkgrel=1
pkgdesc='System monitoring tool with historical data service, triggers and top-like TUI (binary release)'
url="https://github.com/inv2004/ttop"
license=('MIT')
arch=('x86_64')
provides=("ttop")
conflicts=("ttop")
source=("ttop$pkgver::$url/releases/download/v$pkgver/ttop"
        "LICENSE2023::$url/raw/v1.5.2/LICENSE"
        "README$pkgver.md::$url/raw/refs/heads/main/README.md"
        "screen1.png::$url/raw/v1.5.2/.github/images/screen.png")
sha256sums=('ca1106cdd2b9fd84f457220d49af532b314f75b37aa7ae900c340f3fde82dcd7'
            'd02b237a4b7b295eea657a27274b6d6ed08695807006562d7252398e34f59079'
            'f6d7acac33e04305e385205e434f278bbdb183a92284337c89335b899724c532'
            '9746ec96a19dddb22eb8165825c70be3abcf8ff43e44301ef0ad9fc88fa98075')

prepare() {
# Shortcut
  echo -e "[Desktop Entry]
Name=ttop
Exec=ttop
Icon=ttop
Terminal=true
Type=Application
Comment=System monitoring tool with historical data service, triggers and top-like TUI" > ttop.desktop
}

package() {
  install -Dm644 LICENSE2023 "$pkgdir/usr/share/licenses/ttop/LICENSE"
  install -Dm644 screen1.png "$pkgdir/usr/share/pixmaps/ttop.png"
  install -Dm644 README$pkgver.md "$pkgdir/usr/share/doc/ttop/README.md"
  install -Dm644 ttop.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 ttop$pkgver "$pkgdir/usr/bin/ttop"
}
