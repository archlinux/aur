# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=1.9.1
pkgrel=1
pkgdesc='Fast and powerful IPTV app'
arch=('x86_64')
url='https://github.com/fredolx/open-tv'
license=('GPL2')
depends=(
        'mpv'
        'yt-dlp'
        'webkit2gtk-4.1'
        'ffmpeg'
        )
options=(
    !emptydirs
)
source=(
  "https://github.com/Fredolx/open-tv/releases/download/v${pkgver}/Fred.TV_${pkgver}_amd64.deb"
)
sha512sums=('face6f748612aec6e0412c20225df32a347ae0d3c73a84d5b040d1878d78e3b3378fb803f56f56ca266f5e8be9cde2877a9d67aaac1b87ce5b1776e4fb7bd0f0')

prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
}

package() {
    cp -a \
        "${srcdir}/usr/" \
        "${pkgdir}/usr/"
}
