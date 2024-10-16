# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>

pkgname=youtube-downloader-bin
_pkgname=youtube-downloader
pkgver=3.9.9.96
pkgrel=1
pkgdesc='YouTube Downloader by MediaHuman'
arch=('x86_64')
url="https://www.mediahuman.com/download.html"
license=('custom')
depends=('hicolor-icon-theme'
         'qt5-multimedia'
         'taglib')
provide=('youtube-downloader')
conflicts=('youtube-downloader')
source=(https://www.mediahuman.com/download/YouTubeDownloader.amd64.deb)
sha256sums=('192df4544e6a57dcd677ac5f14eed09e903a7cbce8795fe25d36d7e43065055d')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    install -dm755 $pkgdir/usr/bin
    ln -s /opt/$_pkgname/YouTubeDownloader "${pkgdir}/usr/bin/YouTubeDownloader"
}
