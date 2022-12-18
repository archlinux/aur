# Maintainer: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=ffmpeg-gpl-bin
pkgver=latest
pkgrel=1
pkgdesc="FFmpeg minimal for apps usage"
arch=("x86_64" "aarch64")
license=("GPL")
url="https://github.com/BtbN/FFmpeg-Builds"
provides=("ffmpeg")
conflicts=("ffmpeg")

source_x86_64=("https://github.com/BtbN/FFmpeg-Builds/releases/download/${pkgver}/ffmpeg-master-latest-linux64-gpl.tar.xz")
source_aarch64=("https://github.com/BtbN/FFmpeg-Builds/releases/download/${pkgver}/ffmpeg-master-latest-linuxarm64-gpl.tar.xz")

md5sums_x86_64=('SKIP')
md5sums_aarch64=('SKIP')

package() {
	cd ${srcdir}/ffmpeg-master-$pkgver-linux*64-gpl

	install -Dm 755 -t "$pkgdir/usr/bin" bin/ffmpeg bin/ffplay bin/ffprobe
	install -Dm 755 -t "$pkgdir/usr/share/doc/ffmpeg" doc/* LICENSE.txt
}

