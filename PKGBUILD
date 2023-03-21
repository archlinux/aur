# Maintainer: Richard Moe <aur@stuffandjunk.org>


pkgname=yt-dlp-bin
pkgdesc="A youtube-dl fork with additional features and fixes. Binary package."
pkgver=2023.03.04
pkgrel=1
arch=('x86_64' 'aarch64')
url="http://yt-dl.org/"
license=('unlicense')
depends=()
conflicts=('yt-dlp' 'yt-dlp-git')
provides=('yt-dlp')
source_x86_64=(https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp_linux)
source_aarch64=(https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp_linux_aarch64)
sha256sums_x86_64=('7494af600c4389d19961b44e406472bba7c54c28dc1f62bb72bdde7181708a9a')
sha256sums_aarch64=('44cda2ef65655f20c53f10108074b1401568cc73941240fab92cfd57783d24df')
sha256sums=()
case "$CARCH" in
  x86_64) _pkgarch="linux"
    sha256sums+=${sha256sums_x86_64}
    ;;
  aarch64) _pkgarch="linux_aarch64"
    sha256sums+=${sha256sums_aarch64}
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp_${_pkgarch}")

package() {
  # yt-dlp binary
  install -D -m 0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/yt-dlp"
}
