# Maintainer: Shira Nguyen <sn3446409@gmail.com>

pkgname=mkbrr-gui-bin
_srcver="v1.25.0"
pkgver="${_srcver#v}"
pkgver="${pkgver/-rc./_rc}"
pkgrel=1
pkgdesc="A tool to create, modify and inspect torrent files. GUI version"
arch=('x86_64')
url="https://github.com/autobrr/mkbrr/"
license=('GPL-2.0-only')
depends=(
  webkit2gtk-4.1
  libsoup3
  glibc
  gtk3
  gdk-pixbuf2
  hicolor-icon-theme
  glib2
)
options=(!strip)
provides=('mkbrr-gui')
conflicts=('mkbrr-gui')
source=("${pkgname}-${pkgver}.tar.gz::${url}releases/download/${_srcver}/mkbrr-gui_${_srcver}_linux_amd64.tar.gz"
        "mkbrr-gui-license::https://raw.githubusercontent.com/autobrr/mkbrr/${_srcver}/LICENSE"
        mkbrr.png
        mkbrr.desktop)
sha256sums=('2050ee1b80a0c72a176fd9193d80d0935b88b4c1fe302b2e2737379b3d8f1449'
            'SKIP'
            '3d2ae1c183781e2fab4008b42f7d2004bbefe363f3e965e95b7b4e00bb67b93d'
            'ae73ca45fc81e322750454725b5c315b5566625511854ced2716b0c19a4d1515')

package() {
    install -Dm755 "${srcdir}/mkbrr-gui" "${pkgdir}/usr/bin/mkbrr-gui"
    install -Dm644 "${srcdir}/mkbrr.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mkbrr.png"
    install -Dm644 "${srcdir}/mkbrr.desktop" "${pkgdir}/usr/share/applications/mkbrr.desktop"
    install -Dm644 "${srcdir}/mkbrr-gui-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}




