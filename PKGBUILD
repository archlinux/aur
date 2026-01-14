# Maintainer: Mojahid <mojahid8238@gmail.com>
pkgname=rataplay
pkgver=0.1.1
pkgrel=1
pkgdesc="A high-performance Rust TUI for searching, playing and downloading videos (Binary Release)"
arch=('x86_64')
url="https://github.com/mojahid8238/Rataplay"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'openssl' 'mpv' 'yt-dlp')
provides=('rataplay')
conflicts=('rataplay')

# We fetch the binary, license, and readme directly from the release/repo
source=("rataplay::${url}/releases/download/v${pkgver}/rataplay"
        "LICENSE::${url}/raw/v${pkgver}/LICENSE"
        "README.md::${url}/raw/v${pkgver}/README.md")

# Use 'updpkgsums' to generate these, or keep 'SKIP' for personal use
sha256sums=('e45aac90048fb6ce9a46bf8b05948eecee8366455e310ff632ffa20f5d9862f6'
            'e57f1c320b8cf8798a7d2ff83a6f9e06a33a03585f6e065fea97f1d86db84052'
            '03b9c92889b5156994bbd3bd4ad1f70cf766a417ed8138f105642d938a5c9c5d')

package() {
  # Install the binary
  install -Dm755 "${srcdir}/rataplay" "${pkgdir}/usr/bin/rataplay"
  
  # Install docs and license
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/rataplay/README.md"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/rataplay/LICENSE"
}
