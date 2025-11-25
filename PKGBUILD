# Maintainer: queenbiscuit311 <sarahacv6002 At gmail Dot com>
# Credit to oech3 for information on how to switch source from snap to nwjs-ffmpeg-prebuilt and for 'disable-opera-default-ffmpeg.hook' as well as 'enable-opera-default-ffmpeg.install'

pkgname=opera-ffmpeg-codecs-bin
pkgver=140.0.7339.81
_nwjsver=0.103.1
pkgrel=2
epoch=1
pkgdesc="Additional support for proprietary codecs for opera using prebuilt FFmpeg binaries made for NW.js."
arch=('x86_64')
url="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/"
options=('!debug')
license=('LGPL2.1')
depends=('opera')
provides=('opera-ffmpeg-codecs')
conflicts=('opera-ffmpeg-codecs')
source=(
  "https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/0.103.1/0.103.1-linux-x64.zip"
  disable-opera-default-ffmpeg.hook
  enable-opera-default-ffmpeg.install
)
install=enable-opera-default-ffmpeg.install
sha512sums=('d13314a9a89abc5e5a9d00ad43668ca5cd2c6541b737bd783b21b50622295476df335bcff3c6afb11979b712df3efad2294deeaa480faf7dc3c5fbe68c87e6c3' '9bbb2b7d890f78a72ed9890d77b5212d6e43b58c1be1e17b54a592b848f0cc40c0f3396ffd22b784e37af30109a12ed32f3bd03bf99af78baafbf52d10539e8a' '82facd70a9adbdfbf71208deb463322cac025b7515d8aab420b5639190b116ab65a58dfa20c1aa6965251bda4000ee5de7c0124da3cd37665feecb4eebb139a5')

package() {
  install -Dm644 "$srcdir/libffmpeg.so" "$pkgdir/usr/lib/opera-stable/lib_extra/libffmpeg.so"
  install -Dm644 disable-opera-default-ffmpeg.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
