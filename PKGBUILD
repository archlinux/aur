# Maintainer: Mojahid <mojahid8238@gmail.com>
pkgname=rataplay
pkgver=1.1.0
pkgrel=1
pkgdesc="A high-performance Rust TUI for YouTube playback and management (Binary Release)"
arch=('x86_64')
url="https://github.com/mojahid8238/Rataplay"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'openssl' 'mpv' 'yt-dlp')
provides=('rataplay')
conflicts=('rataplay-git')

# Fetching the pre-compiled binary and metadata files
source=("rataplay::${url}/releases/download/v${pkgver}/rataplay"
        "LICENSE::${url}/raw/v${pkgver}/LICENSE"
        "README.md::${url}/raw/v${pkgver}/README.md")

# Ensure these sums match the files on your GitHub Release
sha256sums=('64418a1878fce938bcf00968ad3dea54453eda91dffdaa01fd0241caf3806c4a'
            'e57f1c320b8cf8798a7d2ff83a6f9e06a33a03585f6e065fea97f1d86db84052'
            '03b9c92889b5156994bbd3bd4ad1f70cf766a417ed8138f105642d938a5c9c5d')

package() {
  # Install the binary to /usr/bin/
  install -Dm755 "${srcdir}/rataplay" "${pkgdir}/usr/bin/rataplay"
  
  # Install documentation and license
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
