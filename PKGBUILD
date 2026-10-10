# Maintainer: darkstardevx <dev@cybercoretech.net>

pkgname=cyberterm-bin
_pkgname=cyberterm
pkgver=0.2.1
pkgrel=1
pkgdesc="GPU terminal for developers: splits and sessions, command blocks, searchable history, AI help, inline images and Lua scripting (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://cybercore-tech.github.io/cyberterm/"
license=('MIT')
depends=('gcc-libs' 'glibc' 'fontconfig' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
optdepends=('vulkan-icd-loader: Vulkan rendering (falls back to OpenGL)'
            'ttf-jetbrains-mono-nerd: the default font'
            'noto-fonts-emoji: color emoji'
            'libnotify: desktop notifications for long commands')
provides=('cyberterm')
conflicts=('cyberterm')
_base="https://github.com/cybercore-tech/cyberterm"
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/cybercore-tech/cyberterm/v$pkgver/LICENSE"
        "cyberterm-$pkgver.svg::https://raw.githubusercontent.com/cybercore-tech/cyberterm/v$pkgver/assets/brand/cyberterm-icon.svg"
        "cyberterm.desktop")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$_base/releases/download/v$pkgver/cyberterm-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$_base/releases/download/v$pkgver/cyberterm-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('ec5af8d1007d65d5fa144c2e1658a09fb900d3ccff926a306ebc950e40115337'
            'a686c4e5a39510488c378dc1820304b4d4827b1cd9bcfefe1a25eb7bf53925d1'
            '1e638aff925407a30963bd57a3a942831f5ea86b45a06941f88c23c5d684d0c3')
sha256sums_x86_64=('1622270184917105075a69d70919be49681a8ec8d09ca108f79fc7cdcf0643bb')
sha256sums_aarch64=('d98a43bef32ce88f0ca65cdb19bfa300cbf9a72111e50bbfcd447f80a971fe58')

package() {
  install -Dm755 "$srcdir/cyberterm" "$pkgdir/usr/bin/cyberterm"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/cyberterm-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/cyberterm.svg"
  install -Dm644 "$srcdir/cyberterm.desktop" "$pkgdir/usr/share/applications/cyberterm.desktop"
}
