# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Fast and powerful IPTV app'
arch=('x86_64')
url='https://github.com/fredolx/open-tv'
license=('GPL2')
depends=(
        'mpv'
        'yt-dlp'
        'webkit2gtk-4.1'
        )
options=(
    !emptydirs
)
source=(
  "https://github.com/Fredolx/open-tv/releases/download/v${pkgver}/Open.TV_${pkgver}_amd64.deb"
)
sha512sums=('1563f1afd80228f48f857fdfe1c0357b4612e60fc33e95636aa4247dfb8b22a8d8ad58ca644dc390e52959428167b626f826038fe3e81b80a006484e6699c931')

prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
    cp -a \
        "${srcdir}/usr/" \
        "${pkgdir}/usr/"
}
