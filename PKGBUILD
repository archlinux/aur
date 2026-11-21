# Maintainer: aizigao <14126445+aizigao at users dot noreply dot github dot com>

pkgname=keyboard-tester-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Linux keyboard tester with a visual ANSI TKL layout (prebuilt binary)'
arch=('x86_64')
url='https://github.com/aizigao/keyboard-tester'
license=('MIT')
depends=('glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
         'fontconfig' 'wayland' 'vulkan-icd-loader' 'vulkan-driver')
optdepends=('hyprland: Pin and position the compact window')
provides=("keyboard-tester=$pkgver")
conflicts=('keyboard-tester')
options=('!strip' '!debug')
source=('LICENSE')
sha256sums=('0c5179de52533d82c7f8525b7da3698eea9f7f51adfefdc1cfaeeb1baf5cf83e')
source_x86_64=("$url/releases/download/v$pkgver/keyboard-tester-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('05c198352e73fad512768aa67a0eb14264c67cbdfdffbea558e66fb6655ac149')

package() {
    install -Dm755 "$srcdir/usr/bin/keyboard-tester" "$pkgdir/usr/bin/keyboard-tester"
    install -Dm644 "$srcdir/usr/share/applications/keyboard-tester.desktop" \
        "$pkgdir/usr/share/applications/keyboard-tester.desktop"
    install -Dm644 "$srcdir/usr/share/icons/hicolor/scalable/apps/keyboard-tester.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/keyboard-tester.svg"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
