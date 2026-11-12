# Maintainer: Akrm Al-Hakimi <akrm@cachebag.sh>
pkgname=nmrs-bin
pkgver=2.2.0
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
        "nmrs-$pkgver.svg::https://raw.githubusercontent.com/freedesktop-rs/nmrs-gui/v$pkgver/assets/nmrs.svg"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/freedesktop-rs/nmrs-gui/v$pkgver/LICENSE-MIT")
sha256sums=('7132d58965488a4ff182513b3891f0ed052f1e606e775b59dc863339db6747bb'
            '87e1e8998c98b576bcc2e8f714a8a39d2253deb8ac2a05ac183567dee6988ce0'
            'bfc602256b752e50ef60349e1adb6bf30afceae9097339da256a220f537b1dbb'
            'd1bcd30549a79e7c68f5ac178494332b8cf32b6d1ac3f3ac703188cf7f9b0ee1')

package() {
  install -Dm755 "nmrs-gui-$pkgver" "$pkgdir/usr/bin/nmrs-gui"
  ln -s nmrs-gui "$pkgdir/usr/bin/nmrs"
  install -Dm644 "nmrs-$pkgver.desktop" "$pkgdir/usr/share/applications/nmrs.desktop"
  install -Dm644 "nmrs-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/nmrs.svg"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
