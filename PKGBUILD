# Maintainer: darkstardevx <dev@cybercoretech.net>

pkgname=cyberterm-bin
_pkgname=cyberterm
pkgver=0.4.1
pkgrel=1
pkgdesc="GPU terminal for developers: splits and sessions, command blocks, searchable history, AI help, inline images and Lua scripting (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://cybercoretech.github.io/cyberterm/"
license=('MIT')
depends=('gcc-libs' 'glibc' 'fontconfig' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
optdepends=('vulkan-icd-loader: Vulkan rendering (falls back to OpenGL)'
            'ttf-jetbrains-mono-nerd: the default font'
            'noto-fonts-emoji: color emoji'
            'libnotify: desktop notifications for long commands')
provides=('cyberterm')
conflicts=('cyberterm')
_base="https://github.com/cybercoretech/cyberterm"
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/cybercoretech/cyberterm/v$pkgver/LICENSE"
        "cyberterm-$pkgver.svg::https://raw.githubusercontent.com/cybercoretech/cyberterm/v$pkgver/assets/brand/cyberterm-icon.svg"
        "cyberterm.desktop")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$_base/releases/download/v$pkgver/cyberterm-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$_base/releases/download/v$pkgver/cyberterm-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('808117a1a2d3742aa134cb34ee78a109596fe7f9a29f42288aca788a090316f2'
            'a686c4e5a39510488c378dc1820304b4d4827b1cd9bcfefe1a25eb7bf53925d1'
            '1e638aff925407a30963bd57a3a942831f5ea86b45a06941f88c23c5d684d0c3')
sha256sums_x86_64=('fc485ce1d3b8a85f02a1f736fe15d66979be5db880081c610d34c3f6b299b14c')
sha256sums_aarch64=('96719668bd57597314224891d8f0f1a0689f375fb6b0909294a1b441e22096bc')

package() {
  install -Dm755 "$srcdir/cyberterm" "$pkgdir/usr/bin/cyberterm"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/cyberterm-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/cyberterm.svg"
  install -Dm644 "$srcdir/cyberterm.desktop" "$pkgdir/usr/share/applications/cyberterm.desktop"
}
