# Maintainer: NewYearPrism

pkgname=yt-dlp-standalone-bin
_pkgname=yt-dlp
pkgver=2026.07.04
pkgrel=1
pkgdesc='A feature-rich command-line audio/video downloader (standalone binary)'
arch=(x86_64)
url='https://github.com/yt-dlp/yt-dlp'
license=('Unlicense')
depends=(
    glibc
    zlib
)
optdepends=(
    
)
provides=(
    yt-dlp
)
conflicts=(
    yt-dlp
)
source=(
    "yt-dlp-bin::https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp_linux"
    "yt-dlp.tar.gz::https://github.com/yt-dlp/yt-dlp/releases/download/2026.07.04/yt-dlp.tar.gz"
)
sha256sums=(
    6bbb3d314cde4febe36e5fa1d55462e29c974f63444e707871834f6d8cc210ae
    31c32457d1a573a341bb0929386c624fe47339a5338829e6e9c9454bdfa7397a
)

package() {
  install -Dm755 yt-dlp-bin "${pkgdir}/usr/bin/yt-dlp"

  # Install completions
  install -Dm644 "yt-dlp/completions/bash/yt-dlp" "${pkgdir}/usr/share/bash-completion/completions/yt-dlp"
  install -Dm644 "yt-dlp/completions/zsh/_yt-dlp" "${pkgdir}/usr/share/zsh/site-functions/_yt-dlp"
  install -Dm644 "yt-dlp/completions/fish/yt-dlp.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yt-dlp.fish"
}