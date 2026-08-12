# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=jellyfin-ffmpeg-bin
_pkgver=7.1.4
_pkgrel_upstream=3
pkgver="${_pkgver}_p${_pkgrel_upstream}"
pkgrel=4
_debver="${_pkgver}-${_pkgrel_upstream}"
pkgdesc='Jellyfin fork of ffmpeg (portable static build)'
arch=('x86_64' 'aarch64')
url='https://github.com/jellyfin/jellyfin-ffmpeg'
license=('GPL3')
provides=('jellyfin-ffmpeg')
conflicts=('jellyfin-ffmpeg')
depends=('glibc')
source_x86_64=("https://repo.jellyfin.org/files/ffmpeg/linux/7.x/$_debver/amd64/jellyfin-ffmpeg_${_debver}_portable_linux64-gpl.tar.xz")
source_aarch64=("https://repo.jellyfin.org/files/ffmpeg/linux/7.x/$_debver/arm64/jellyfin-ffmpeg_${_debver}_portable_linuxarm64-gpl.tar.xz")
sha256sums_x86_64=('cab9ff40a47e4232d231e4eb7e4e85fabfeec56c6905266bc94291fc0881f83f')
sha256sums_aarch64=('77e4b5d044ab73e1f26c9aadaa5d6014d1782500bf2c29afb3ab81f5bea98b1f')

package() {
    install -dm755 "$pkgdir/usr/lib/jellyfin-ffmpeg"
    install -m755 "$srcdir/ffmpeg" "$pkgdir/usr/lib/jellyfin-ffmpeg/ffmpeg"
    install -m755 "$srcdir/ffprobe" "$pkgdir/usr/lib/jellyfin-ffmpeg/ffprobe"
}
