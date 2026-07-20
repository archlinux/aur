# Maintainer: Wilson Glasser <wilsonglasser@gmail.com>
# pkgver/pkgrel/sha256sums are stamped by CI at release time
# (.github/workflows/release.yml, `aur` job) and pushed to the AUR.
pkgname=oryxis-bin
pkgver=0.10.0
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
sha256sums_x86_64=('d31c7ce203380c47162faab5fc271490b9aec0f64366316daae9aa08e414c5a7')
sha256sums_aarch64=('83f5d03220beee2d4f1bc74328a807263e261c447e0f75955788bd76949cc6fe')

package() {
    install -Dm755 "$srcdir/oryxis" "$pkgdir/usr/bin/oryxis"
    install -Dm644 "$srcdir/oryxis.desktop" "$pkgdir/usr/share/applications/oryxis.desktop"
    install -Dm644 "$srcdir/logo_64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/oryxis.png"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/oryxis/README.md"
}
