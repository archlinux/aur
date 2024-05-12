# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=ttop-bin
pkgver=1.5.0
pkgrel=2
pkgdesc='System monitoring tool with historical data service, triggers and top-like TUI (binary release)'
url="https://github.com/inv2004/ttop"
license=('MIT')
arch=('x86_64')
provides=("ttop")
conflicts=("ttop")
source=("ttop$pkgver::$url/releases/download/v$pkgver/ttop"
        "LICENSE2023::$url/raw/v$pkgver/LICENSE"
        "README$pkgver.md::$url/raw/v$pkgver/README.md"
        "screen$pkgver.png::$url/raw/v$pkgver/.github/images/screen.png")
sha256sums=('1b725380538fcc4a22356eba7f3a084d247ebf79af00012dd2cdab41b2401624'
            'd02b237a4b7b295eea657a27274b6d6ed08695807006562d7252398e34f59079'
            '2a8e481fa846fcc5623f721a4aba8d9b7afee2ff2eaed8234a06107f77ac4d9d'
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
  install -Dm644 README$pkgver.md "$pkgdir/usr/share/doc/ttop/README.md"
  install -Dm644 screen$pkgver.png "$pkgdir/usr/share/pixmaps/ttop.png"
  install -Dm644 ttop.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 ttop$pkgver "$pkgdir/usr/bin/ttop"
}
