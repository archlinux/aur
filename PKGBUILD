# Maintainer: Akrm Al-Hakimi <alhakimiakrmj@gmail.com>
pkgname=nmrs-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="NetworkManager client built on nmrs and gpui (prebuilt binary)"
arch=('x86_64')
url="https://github.com/freedesktop-rs/nmrs-gui"
license=('MIT')
depends=('networkmanager' 'fontconfig' 'freetype2' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')
provides=('nmrs')
conflicts=('nmrs')
options=('!strip' '!debug')
source=("nmrs-gui-$pkgver::$url/releases/download/v$pkgver/nmrs-gui-x86_64-linux"
        "nmrs-$pkgver.desktop::https://raw.githubusercontent.com/freedesktop-rs/nmrs-gui/v$pkgver/nmrs.desktop"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/freedesktop-rs/nmrs-gui/v$pkgver/LICENSE-MIT")
sha256sums=('ad9bc1d3decc93fa8ee92a0e5086225039a334a9f491d7f51a75e184e10fd7e2'
            'eb8d6cb65349cf1a317d31f9f840a5c77473a9814428d277cb79daefcb24501d'
            'd1bcd30549a79e7c68f5ac178494332b8cf32b6d1ac3f3ac703188cf7f9b0ee1')

package() {
  install -Dm755 "nmrs-gui-$pkgver" "$pkgdir/usr/bin/nmrs-gui"
  ln -s nmrs-gui "$pkgdir/usr/bin/nmrs"
  install -Dm644 "nmrs-$pkgver.desktop" "$pkgdir/usr/share/applications/nmrs.desktop"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
