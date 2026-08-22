# Maintainer: NewYearPrism

pkgname=yt-dlp-standalone-bin
_pkgname=yt-dlp
pkgver=2026.08.19
pkgrel=1
pkgdesc='A feature-rich command-line audio/video downloader (standalone binary)'
arch=(x86_64)
url='https://github.com/yt-dlp/yt-dlp'
license=('Unlicense')
depends=(
    glibc
    zlib
)
provides=(
    yt-dlp
)
conflicts=(
    yt-dlp
)
source=(
    "yt-dlp_linux::https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp_linux"
    "yt-dlp.tar.gz::https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp.tar.gz"
)
sha256sums=(
    58162f9bfdc27458ea47bfcb311cf47028f17d8154a8bf7d689861d46399230a
    072aad4f2a7604e92155f61a275a4752dc64046c8f6d90df3710525d94cd37c1
)

package() {
  install -Dm755 yt-dlp_linux "${pkgdir}/usr/bin/yt-dlp"

  # Install completions
  install -Dm644 "yt-dlp/completions/bash/yt-dlp" "${pkgdir}/usr/share/bash-completion/completions/yt-dlp"
  install -Dm644 "yt-dlp/completions/zsh/_yt-dlp" "${pkgdir}/usr/share/zsh/site-functions/_yt-dlp"
  install -Dm644 "yt-dlp/completions/fish/yt-dlp.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yt-dlp.fish"
}