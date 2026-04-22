# Maintainer: Matthew Cushing <hgxtymphwn@privaterelay.appleid.com>
pkgname=wdotool-bin
_pkgname=wdotool
pkgver=0.1.5
pkgrel=1
pkgdesc="xdotool-compatible input automation for Wayland (prebuilt binary)"
arch=('x86_64')
url="https://github.com/cushycush/wdotool"
license=('MIT' 'Apache-2.0')
depends=('libxkbcommon' 'wayland')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/wdotool-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('8745166459ca69ac2b05fae8c096a3c8ca08fe9ae8c7cda167ad152ad48f1d4f')

package() {
    cd "wdotool-x86_64-unknown-linux-gnu"
    install -Dm755 wdotool "$pkgdir/usr/bin/wdotool"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
