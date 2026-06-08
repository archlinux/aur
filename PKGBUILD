# Maintainer: Wilson Glasser <wilsonglasser@gmail.com>
pkgname=oryxis-bin
pkgver=0.8.1
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
sha256sums_x86_64=('ff9b9a0172f5441275715e353938495172ee6859149f37ab15caf1b03abeb4b0')
sha256sums_aarch64=('b8938cb2d09e10d348ae436166b71ecc3e838e673a66aa14515c893b5568eea9')

package() {
    install -Dm755 "$srcdir/oryxis" "$pkgdir/usr/bin/oryxis"
    install -Dm644 "$srcdir/oryxis.desktop" "$pkgdir/usr/share/applications/oryxis.desktop"
    install -Dm644 "$srcdir/logo_64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/oryxis.png"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/oryxis/README.md"
}
