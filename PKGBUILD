# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=1.0.3
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
sha512sums=('7f5ea30878736d0477931dbe8377371d8bb922a005bddde04f7a110945024ada38c017fa3c5fb7a2848fceff0c4b42e407ce6d7ff5eef388be4c251ce4785bb6')

prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
    cp -a \
        "${srcdir}/usr/" \
        "${pkgdir}/usr/"
}
