# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=ttop-bin
pkgver=1.2.6
pkgrel=2
pkgdesc='System monitoring tool with historical data service, triggers and top-like TUI (binary release)'
url="https://github.com/inv2004/ttop"
arch=('x86_64')
license=('MIT')
conflicts=(ttop)
provides=(ttop)
source=("ttop$pkgver::$url/releases/download/v$pkgver/ttop"
        "LICENSE$pkgver::$url/raw/v$pkgver/LICENSE"
        "ttop.png::https://user-images.githubusercontent.com/4949069/265200595-6a41ff81-6263-4ea7-a3a8-cf3f44227610.png")
sha256sums=('66bdcccf5d2ba92aa9c74c7f43803dfb4dfc1e3cd4e5564ed9056c162a872866'
            'd02b237a4b7b295eea657a27274b6d6ed08695807006562d7252398e34f59079'
            '2ac1c78513b363d4c5817493c878a863552657347c5ddf5dfd2d8e6286cedab6')

prepare() {
  # Create a shortcut
  echo -e "[Desktop Entry]
Name=ttop
Exec=ttop
Icon=ttop
Terminal=true
Type=Application
Comment=System monitoring tool with historical data service, triggers and top-like TUI" > ttop.desktop
}

package() {
  install -Dm644 LICENSE$pkgver "$pkgdir/usr/share/licenses/ttop/LICENSE"
  install -Dm644 ttop.png -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 ttop.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 ttop -t "$pkgdir/usr/bin"
}
