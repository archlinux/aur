# Maintainer: Matthew Cushing <hgxtymphwn@privaterelay.appleid.com>
pkgname=wdotool-bin
_pkgname=wdotool
pkgver=0.3.0
pkgrel=1
pkgdesc="xdotool-compatible input automation for Wayland (prebuilt binary)"
arch=('x86_64')
url="https://github.com/cushycush/wdotool"
license=('MIT' 'Apache-2.0')
depends=('libxkbcommon' 'wayland')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/wdotool-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('dc122169d6c29e8cbdec8c62686109452a143a0a0039621e1eb594eb9788c5c8')

package() {
    cd "wdotool-x86_64-unknown-linux-gnu"
    install -Dm755 wdotool "$pkgdir/usr/bin/wdotool"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
