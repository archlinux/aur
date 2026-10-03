# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=jellyfin-ffmpeg-bin
_pkgver=8.1.3
_pkgrel_upstream=1
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
sha256sums_x86_64=('b86dc023c64a5a9a410e6e3a938a970460214fae78f31c1553c9f88f1c289b6a')
sha256sums_aarch64=('7bc8e8d0986f7f4693f63e9728570f671f07b6e21c05d5465dd7ce461d1631dc')

package() {
    install -dm755 "$pkgdir/usr/lib/jellyfin-ffmpeg"
    install -m755 "$srcdir/ffmpeg" "$pkgdir/usr/lib/jellyfin-ffmpeg/ffmpeg"
    install -m755 "$srcdir/ffprobe" "$pkgdir/usr/lib/jellyfin-ffmpeg/ffprobe"
}
