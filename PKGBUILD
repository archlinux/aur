# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=1.3.0
pkgrel=2
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
sha512sums=('460e0b399cd075faa5d230d7e3571ccfc4f9b523f79f9095dd13e081b96f7ef606997a349c458e407ea93da755d0a3adc1bab18536bae1f99ce456c9dbdc9008')

prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
    cp -a \
        "${srcdir}/usr/" \
        "${pkgdir}/usr/"
}
