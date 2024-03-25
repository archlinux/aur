# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=ttop-bin
pkgver=1.4.2
pkgrel=1
pkgdesc='System monitoring tool with historical data service, triggers and top-like TUI (binary release)'
url="https://github.com/inv2004/ttop"
license=('MIT')
arch=('x86_64')
provides=("ttop")
conflicts=("ttop")
source=("ttop$pkgver::$url/releases/download/v$pkgver/ttop"
        "LICENSE2023::$url/raw/v$pkgver/LICENSE"
        "README$pkgver.md::$url/raw/v$pkgver/README.md"
        "ttop.png::https://user-images.githubusercontent.com/4949069/265200595-6a41ff81-6263-4ea7-a3a8-cf3f44227610.png")
sha256sums=('f7c27b9f0904ea80d8426e1bd10f7cf1a316d1564d77c2d0a21a94420344e73b'
            'd02b237a4b7b295eea657a27274b6d6ed08695807006562d7252398e34f59079'
            '63cd96fb8962c2e59a0a3dea25dced32cef8597664e53bdeba9033b4d7cf7960'
            '2ac1c78513b363d4c5817493c878a863552657347c5ddf5dfd2d8e6286cedab6')

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
  install -Dm644 ttop.png -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 ttop.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 ttop$pkgver "$pkgdir/usr/bin/ttop"
}
