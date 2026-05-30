# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=jellyfin-ffmpeg-bin
pkgver=7.1.4
_pkgrel_upstream=1
pkgrel=1
_debver="${pkgver}-${_pkgrel_upstream}"
pkgdesc='Jellyfin fork of ffmpeg (portable static build)'
arch=('x86_64' 'aarch64')
url='https://github.com/jellyfin/jellyfin-ffmpeg'
license=('GPL3')
provides=('jellyfin-ffmpeg')
conflicts=('jellyfin-ffmpeg')
depends=('glibc')
source_x86_64=("https://repo.jellyfin.org/files/ffmpeg/linux/7.x/$_debver/amd64/jellyfin-ffmpeg_${_debver}_portable_linux64-gpl.tar.xz")
source_aarch64=("https://repo.jellyfin.org/files/ffmpeg/linux/7.x/$_debver/arm64/jellyfin-ffmpeg_${_debver}_portable_linuxarm64-gpl.tar.xz")
sha256sums_x86_64=('e195dd28272c2c6e9640f829561326e90a2bbbb04b322067ad6090215a5764c2')
sha256sums_aarch64=('a8567bcace6bf11bfde5449b5cf5336cb9355a14032c68ca62487ecfeb118f8b')

package() {
    install -dm755 "$pkgdir/usr/lib/jellyfin-ffmpeg"
    install -m755 "$srcdir/ffmpeg" "$pkgdir/usr/lib/jellyfin-ffmpeg/ffmpeg"
    install -m755 "$srcdir/ffprobe" "$pkgdir/usr/lib/jellyfin-ffmpeg/ffprobe"
}
