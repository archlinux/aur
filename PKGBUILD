# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=jellyfin-ffmpeg-bin
_pkgver=8.1.3
_pkgrel_upstream=2
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
sha256sums_x86_64=('1df84d04c4322902dba81c290508cdf3d89524d210b9fe03154bea6c4e3bfbb6')
sha256sums_aarch64=('6522585818059cc886363fb1dee86ac9b8579fec3b914337fb92974ef9eb9884')

package() {
    install -dm755 "$pkgdir/usr/lib/jellyfin-ffmpeg"
    install -m755 "$srcdir/ffmpeg" "$pkgdir/usr/lib/jellyfin-ffmpeg/ffmpeg"
    install -m755 "$srcdir/ffprobe" "$pkgdir/usr/lib/jellyfin-ffmpeg/ffprobe"
}
