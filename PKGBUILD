# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=1.5.2
pkgrel=2
pkgdesc='Fast and powerful IPTV app'
arch=('x86_64')
url='https://github.com/fredolx/open-tv'
license=('GPL2')
depends=(
        'mpv'
        'yt-dlp'
        'webkit2gtk-4.1'
        'ffmpeg'
        'libayatana-appindicator'
        )
options=(
    !emptydirs
)
source=(
  "https://github.com/Fredolx/open-tv/releases/download/v${pkgver}/Open.TV_${pkgver}_amd64.deb"
)
sha512sums=('ef1734877cdd362d6696d6bbf00363c7ead68a7d8db8f42b79d6078fa41c546944a02a93e04120420dd15a9c63bcc3a3724684529173faa96bdfaf61faa55ec6')

prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
    cp -a \
        "${srcdir}/usr/" \
        "${pkgdir}/usr/"
}
