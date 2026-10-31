# Maintainer: Mojahid <mi8238229@gmail.com>
pkgname=rataplay
_tag=v1.6.0
pkgver=1.6.0
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
source=("rataplay::${url}/releases/download/${_tag}/rataplay"
	"LICENSE::${url}/raw/${_tag}/LICENSE"
	"rataplay.1::${url}/raw/${_tag}/man/rataplay.1")
#checksums for binary 
sha256sums=('201ff8c3244795b65c8471a44f777c590b2598c5f636ad5778bd0907b7dbe41c'
            'e57f1c320b8cf8798a7d2ff83a6f9e06a33a03585f6e065fea97f1d86db84052'
            '92b356bce654ec6bec4a088c45912117e0ab870aabeb087e3af2aef13cec1edb')

package() {
  # Install the binary to /usr/bin/
  install -Dm755 "${srcdir}/rataplay" "${pkgdir}/usr/bin/rataplay"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/rataplay.1" "${pkgdir}/usr/share/man/man1/rataplay.1"
}
