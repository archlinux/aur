# Maintainer: queenbiscuit311 <sarahacv6002 At gmail Dot com>
# Credit to oech3 for information on how to switch source from snap to nwjs-ffmpeg-prebuilt and for 'disable-opera-developer-default-ffmpeg.hook' as well as 'enable-opera-developer-default-ffmpeg.install'

pkgname=opera-developer-ffmpeg-codecs-bin
pkgver=140.0.7339.81
_nwjsver=0.103.1
pkgrel=1
epoch=1
pkgdesc="Additional support for proprietary codecs for opera-developer using prebuilt FFmpeg binaries made for NW.js."
arch=('x86_64')
url="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/"
options=('!debug')
license=('LGPL2.1')
depends=('opera-developer')
provides=('opera-developer-ffmpeg-codecs')
conflicts=('opera-developer-ffmpeg-codecs')
source=(
  "https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/0.103.1/0.103.1-linux-x64.zip"
  disable-opera-developer-default-ffmpeg.hook
  enable-opera-developer-default-ffmpeg.install
)
install=enable-opera-developer-default-ffmpeg.install
sha512sums=('d13314a9a89abc5e5a9d00ad43668ca5cd2c6541b737bd783b21b50622295476df335bcff3c6afb11979b712df3efad2294deeaa480faf7dc3c5fbe68c87e6c3' '4b7cc638f39cafd9a74a1b4fa9455da26c11d48f83fff781fd94427ec90df5e1c1fb1bc15b464c5fb3976a0977e998cced04e1901551abf1f6bc83513977de08' 'c3140c43b2ef45f1ecf7154ed63f4443ec5953b7ad40c3a2bf13a85a0613507d66a7bf57f4c0552ff62177fa88ff184f3b54fe02c9d918b93da01f41fe8c210f')

package() {
  install -Dm644 "$srcdir/libffmpeg.so" "$pkgdir/usr/lib/opera-developer/lib_extra/libffmpeg.so"
  install -Dm644 disable-opera-developer-default-ffmpeg.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
