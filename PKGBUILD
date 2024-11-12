# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>

pkgname=youtube-downloader-bin
_pkgname=youtube-downloader
pkgver=3.9.9.96
pkgrel=6
pkgdesc='YouTube Downloader by MediaHuman'
arch=('x86_64')
url="https://www.mediahuman.com/download.html"
license=('LicenseRef-custom')
depends=('hicolor-icon-theme'
         'qt5-multimedia'
         'qt5-webengine'
         'qt5-declarative'
         'taglib1'
         'ffmpeg')
provide=('youtube-downloader')
conflicts=('youtube-downloader')
source_x86_64=("http://schinfo.synology.me/public/MediaHuman/${_pkgname}-${pkgver}.deb")
sha256sums_x86_64=('45310c65fb2a61bd972fc39ecb9b469001c0fb26710b3b69757611e754326e64')

package() {
  bsdtar -xf data.tar.xz -C ${pkgdir}/
  install -D "${pkgdir}/usr/share/doc/${_pkgname}/copyright" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -dm755 $pkgdir/usr/bin
  ln -s /opt/$_pkgname/YouTubeDownloader "${pkgdir}/usr/bin/YouTubeDownloader"
}
