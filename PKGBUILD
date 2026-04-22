# Maintainer: Matthew Cushing <hgxtymphwn@privaterelay.appleid.com>
pkgname=wdotool-bin
_pkgname=wdotool
pkgver=0.1.3
pkgrel=1
pkgdesc="xdotool-compatible input automation for Wayland (prebuilt binary)"
arch=('x86_64')
url="https://github.com/cushycush/wdotool"
license=('MIT' 'Apache-2.0')
depends=('libxkbcommon' 'wayland')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/wdotool-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('9b268f18da4d74f8770fcf00962bbb01f30882e35d462191a233911a7f0a44d3')

package() {
    cd "wdotool-x86_64-unknown-linux-gnu"
    install -Dm755 wdotool "$pkgdir/usr/bin/wdotool"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
