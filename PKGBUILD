# Maintainer: Matthew Cushing <hgxtymphwn@privaterelay.appleid.com>
pkgname=wdotool-bin
_pkgname=wdotool
pkgver=0.1.4
pkgrel=1
pkgdesc="xdotool-compatible input automation for Wayland (prebuilt binary)"
arch=('x86_64')
url="https://github.com/cushycush/wdotool"
license=('MIT' 'Apache-2.0')
depends=('libxkbcommon' 'wayland')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/wdotool-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('ed0883525a1448bebd53868b14659025a58babd2cffd9ee46a904b307c095459')

package() {
    cd "wdotool-x86_64-unknown-linux-gnu"
    install -Dm755 wdotool "$pkgdir/usr/bin/wdotool"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
