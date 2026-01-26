# Maintainer: Mojahid <mi8238229@gmail.com>
pkgname=rataplay
pkgver=1.2
pkgrel=1
pkgdesc="A high-performance Rust TUI for YouTube playback and management (Binary Release)"
arch=('x86_64')
url="https://github.com/mojahid8238/Rataplay"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'openssl' 'mpv' 'yt-dlp')
provides=('rataplay')
options=('!strip' '!debug')
conflicts=('rataplay-git')

# Fetching the pre-compiled binary and metadata files
source=("rataplay::${url}/releases/download/v${pkgver}/rataplay"
	"LICENSE::${url}/raw/v${pkgver}/LICENSE")
#checksums for binary 
sha256sums=('a0bcd24f8edf801769b8aa0be0ad675e128e5fdaec938fa18a3b0cdb7083a9b0'
            'e57f1c320b8cf8798a7d2ff83a6f9e06a33a03585f6e065fea97f1d86db84052')

package() {
  # Install the binary to /usr/bin/
  install -Dm755 "${srcdir}/rataplay" "${pkgdir}/usr/bin/rataplay"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
