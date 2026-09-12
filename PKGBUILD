# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=jellyfin-ffmpeg-bin
_pkgver=8.1.2
_pkgrel_upstream=4
pkgver="${_pkgver}p${_pkgrel_upstream}"
pkgrel=1
_debver="${_pkgver}-${_pkgrel_upstream}"
pkgdesc='Jellyfin fork of ffmpeg (portable static build)'
arch=('x86_64' 'aarch64')
url='https://github.com/jellyfin/jellyfin-ffmpeg'
license=('GPL3')
provides=('jellyfin-ffmpeg')
conflicts=('jellyfin-ffmpeg')
depends=('glibc')
source_x86_64=("https://repo.jellyfin.org/files/ffmpeg/linux/8.x/$_debver/amd64/jellyfin-ffmpeg_${_debver}_portable_linux64-gpl.tar.xz")
source_aarch64=("https://repo.jellyfin.org/files/ffmpeg/linux/8.x/$_debver/arm64/jellyfin-ffmpeg_${_debver}_portable_linuxarm64-gpl.tar.xz")
sha256sums_x86_64=('6e7150c358f9817a04ce82c62d81135cb4535d8525047393f4b296fff3d7a664')
sha256sums_aarch64=('ceb9642ee513491d0440bc0027dfa33f2fc6c9966cabb0ec69f43edcbb853e84')

package() {
    install -dm755 "$pkgdir/usr/lib/jellyfin-ffmpeg"
    install -m755 "$srcdir/ffmpeg" "$pkgdir/usr/lib/jellyfin-ffmpeg/ffmpeg"
    install -m755 "$srcdir/ffprobe" "$pkgdir/usr/lib/jellyfin-ffmpeg/ffprobe"
}
