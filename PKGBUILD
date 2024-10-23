# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>

pkgname=youtube-to-mp3-bin
_pkgname=youtube-to-mp3
pkgver=3.9.96
pkgrel=1
pkgdesc='YouTube to MP3 Converter by MediaHuman'
arch=('x86_64')
url="https://www.mediahuman.com/download.html"
license=('custom')
depends=('hicolor-icon-theme'
         'qt5-multimedia'
         'taglib')
provide=('youtube-to-mp3')
conflicts=('youtube-to-mp3')
source=(https://www.mediahuman.com/download/YouTubeToMP3.amd64.deb)
sha256sums=('bba6310f28d2fc15c2d241442cd5a71278d501d61ec16eeda47c4942eaf037c5')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    install -dm755 $pkgdir/usr/bin
    ln -s /opt/$_pkgname/YouTubeToMP3 "${pkgdir}/usr/bin/YouTubeToMP3"
}
