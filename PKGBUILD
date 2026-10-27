# Maintainer: Coobyk <https://github.com/Coobyk>
pkgname=cumpressor-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Private, on-device video compressor built with Rust and GPUI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Coobyk/Cumpressor"
license=('MIT')
depends=('ffmpeg' 'fontconfig' 'freetype2' 'libx11' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')
provides=('cumpressor')
conflicts=('cumpressor')
source=("cumpressor-linux-x64.tar.gz::https://github.com/Coobyk/Cumpressor/releases/download/v$pkgver/cumpressor-linux-x64.tar.gz"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/Coobyk/Cumpressor/v$pkgver/LICENSE")
sha256sums=('653eef649363e81b14f8147783a31ebd325451da40869d6429070773ee3900dc'
            '3d668656749ec34086a42c91666749947fec5d9c835c2db88419431fef767e3c')

package() {
  install -Dm755 cumpressor -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
