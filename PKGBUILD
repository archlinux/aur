# Maintainer: longyinstudio<1606776851@qq.com>
pkgname=video-downloader-longyinstudio
pkgver=0.3.0
pkgrel=1
pkgdesc="Download videos from websites like YouTube and many others (based on yt-dlp)"
arch=('x86_64')
url="https://github.com/LongYinStudio/video-downloader"
_ghurl="https://github.com/LongYinStudio/video-downloader"
license=('mit')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'webkit2gtk-4.1')
source=(
  "https://github.com/LongYinStudio/video-downloader/releases/download/v$pkgver/video-downloader_"$pkgver"_amd64.deb"
  "logo.svg"
  "video-downloader.desktop"
)
sha256sums=(
  'SKIP'
  'd8dc762580ddebd7ea62583eaa24fb6f094b419740ca2a6fdaaf9ae8ec722cd1'
  '6ef15947eadedf7c5f7cdd19d5f299117fa2a1616eef3e3795e0dba70fb1f512'
)

package() {
  echo "Extracting the data.tar.gz..."
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/video-downloader.svg"
  install -Dm644 "${srcdir}/video-downloader.desktop" "${pkgdir}/usr/share/applications/video-downloader.desktop"
}
