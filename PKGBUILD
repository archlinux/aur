# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=1.8.0
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
        'libayatana-appindicator'
        )
options=(
    !emptydirs
)
source=(
  "https://github.com/Fredolx/open-tv/releases/download/v${pkgver}/Open.TV_${pkgver}_amd64.deb"
)
sha512sums=('ce58b405e067451e092a1f2ef0d4ac99e0ce71628a8e9c37b57b8e86d7236d064b15a9d8497436a9e6649c45dd70aadf04e086ea33ed730e9aedb3d2257a6bcc')

prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
    cp -a \
        "${srcdir}/usr/" \
        "${pkgdir}/usr/"
}
