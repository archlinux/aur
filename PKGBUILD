# Maintainer: queenbiscuit311 <sarahacv6002 At gmail Dot com>
# Credit to oech3 for information on how to switch source from snap to nwjs-ffmpeg-prebuilt and for 'disable-opera-beta-default-ffmpeg.hook' as well as 'enable-opera-beta-default-ffmpeg.install'

pkgname=opera-beta-ffmpeg-codecs-bin
pkgver=140.0.7339.81
_nwjsver=0.103.1
pkgrel=1
epoch=1
pkgdesc="Additional support for proprietary codecs for opera-beta using prebuilt FFmpeg binaries made for NW.js."
arch=('x86_64')
url="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/"
options=('!debug')
license=('LGPL2.1')
depends=('opera-beta')
provides=('opera-beta-ffmpeg-codecs')
conflicts=('opera-beta-ffmpeg-codecs')
source=(
  "https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/0.103.1/0.103.1-linux-x64.zip"
  disable-opera-beta-default-ffmpeg.hook
  enable-opera-beta-default-ffmpeg.install
)
install=enable-opera-beta-default-ffmpeg.install
sha512sums=('d13314a9a89abc5e5a9d00ad43668ca5cd2c6541b737bd783b21b50622295476df335bcff3c6afb11979b712df3efad2294deeaa480faf7dc3c5fbe68c87e6c3' 'ff68d7d86d97dad5b6aaa800b06b518d77a6d39e7f942512106e10c9df8e7348f3b93c1d842b30ed68665f8d723f6b1f66e393c06b6f3e2bf3a342aa04243090' '329a0576eae61c568816da98605ed95a67032bf3c4b6db8b4178489e6ed1fce5ecd3e1b1b7b9e440ba918405ed3af2c9fbd3d6e09bf12fce3f8fcffc9ea1809d')

package() {
  install -Dm644 "$srcdir/libffmpeg.so" "$pkgdir/usr/lib/opera-beta/lib_extra/libffmpeg.so"
  install -Dm644 disable-opera-beta-default-ffmpeg.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
