# Maintainer: Wilson Glasser <wilsonglasser@gmail.com>
# pkgver/pkgrel/sha256sums are stamped by CI at release time
# (.github/workflows/release.yml, `aur` job) and pushed to the AUR.
pkgname=oryxis-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='Modern SSH client built in Rust (encrypted vault, P2P sync, AI, Kubernetes)'
arch=('x86_64' 'aarch64')
url='https://github.com/wilsonglasser/oryxis'
license=('AGPL-3.0-or-later')
# Windowing/GPU libs are dlopen'd at runtime (not shown by ldd), so list them here.
depends=('gcc-libs' 'glibc' 'fontconfig' 'libx11' 'libxcb' 'libxcursor'
         'libxi' 'libxkbcommon' 'wayland' 'libglvnd' 'vulkan-icd-loader')
provides=('oryxis')
conflicts=('oryxis')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/oryxis-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/oryxis-linux-aarch64.tar.gz")
sha256sums_x86_64=('4db4186d140b2f91c6b0138d48e7d397fc1deda14ef529be5d4ac8f4d13b8168')
sha256sums_aarch64=('0eccd732bd70fed2909d0b388d3a98bd0cab869c2b2730dd7de4dd0d488f3145')

package() {
    install -Dm755 "$srcdir/oryxis" "$pkgdir/usr/bin/oryxis"
    install -Dm644 "$srcdir/oryxis.desktop" "$pkgdir/usr/share/applications/oryxis.desktop"
    install -Dm644 "$srcdir/logo_64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/oryxis.png"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/oryxis/README.md"
}
