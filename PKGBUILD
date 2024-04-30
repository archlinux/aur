# Maintainer: queenbiscuit311 <sarahacv6002 At gmail Dot com>
# I don't know where the libffmpeg version numbers in this snap come from

pkgname=opera-beta-ffmpeg-codecs-bin
pkgver=114023
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera-beta, extracted directly from the chromium-ffmpeg snap"
arch=('x86_64')
url="https://snapcraft.io/chromium-ffmpeg/"
options=('!debug')
license=('LGPL2.1')
depends=('opera-beta')
provides=('opera-beta-ffmpeg-codecs')
conflicts=('opera-beta-ffmpeg-codecs')
makedepends=('p7zip')
source=(
  "https://api.snapcraft.io/api/v1/snaps/download/XXzVIXswXKHqlUATPqGCj2w2l7BxosS8_37.snap"
)
sha512sums=('91dab24b8bf46eefe0625c82a01e09d79ecac00c3625243b9a818f45b6f1fce6e8e80c114fb04bc9a399168254e743dec78b186edda05be63be9b47b4dde49de')

prepare() {
  7z x XXzVIXswXKHqlUATPqGCj2w2l7BxosS8_37.snap -oextract
}

package() {
  cd "$srcdir/extract/chromium-ffmpeg-$pkgver/chromium-ffmpeg"
  install -Dm644 libffmpeg.so "$pkgdir/usr/lib/opera-beta/lib_extra/libffmpeg.so"
}
