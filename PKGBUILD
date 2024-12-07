# Maintainer: queenbiscuit311 <sarahacv6002 At gmail Dot com>
# I don't know where the libffmpeg version numbers in this snap come from

pkgname=opera-ffmpeg-codecs-bin
pkgver=116575
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera, extracted directly from the chromium-ffmpeg snap"
arch=('x86_64')
url="https://snapcraft.io/chromium-ffmpeg/"
options=('!debug')
license=('LGPL2.1')
depends=('opera')
provides=('opera-ffmpeg-codecs')
conflicts=('opera-ffmpeg-codecs')
makedepends=('p7zip')
source=(
  "https://api.snapcraft.io/api/v1/snaps/download/XXzVIXswXKHqlUATPqGCj2w2l7BxosS8_63.snap"
)
sha512sums=('3a75d3ca8a4272dc6611ac8e703c765c8e0686af06973500b78ab912f1052f95b14d518d923839e9bb2ec341a3a768ba2e6a29389ae15328e815310b3806cc2c')

prepare() {
  7z x XXzVIXswXKHqlUATPqGCj2w2l7BxosS8_63.snap -oextract
}

package() {
  cd "$srcdir/extract/chromium-ffmpeg-$pkgver/chromium-ffmpeg"
  install -Dm644 libffmpeg.so "$pkgdir/usr/lib/opera/lib_extra/libffmpeg.so"
}
