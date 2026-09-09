# Maintainer: Wilson Glasser <wilsonglasser@gmail.com>
# pkgver/pkgrel/sha256sums are stamped by CI at release time
# (.github/workflows/release.yml, `aur` job) and pushed to the AUR.
pkgname=oryxis-bin
pkgver=0.18.0
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
sha256sums_x86_64=('a4d4553ff8c6a786410117aa5f29d602514a2c97af807cac5aa067ed772f862c')
sha256sums_aarch64=('64e1447ca94cc5f4c78bc3379e38d40f061ec2a298620ef0b62bdf27013d0663')

package() {
    install -Dm755 "$srcdir/oryxis" "$pkgdir/usr/bin/oryxis"
    install -Dm644 "$srcdir/oryxis.desktop" "$pkgdir/usr/share/applications/oryxis.desktop"
    install -Dm644 "$srcdir/logo_64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/oryxis.png"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/oryxis/README.md"
}
