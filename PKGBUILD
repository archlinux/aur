# Maintainer: queenbiscuit311 <sarahacv6002 At gmail Dot com>
# I don't know where the libffmpeg version numbers in this snap come from

pkgname=opera-beta-ffmpeg-codecs-bin
pkgver=115541
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
  "https://api.snapcraft.io/api/v1/snaps/download/XXzVIXswXKHqlUATPqGCj2w2l7BxosS8_41.snap"
)
sha512sums=('4d17e904ad2ccac7946b87c9ccd437510980db0b2abe9ec17f957af3ebae332e3df94fb3d40ed2164880f69d946604d7e9947c541f208aa53273d4b38a2b0f0c')

prepare() {
  7z x XXzVIXswXKHqlUATPqGCj2w2l7BxosS8_41.snap -oextract
}

package() {
  cd "$srcdir/extract/chromium-ffmpeg-$pkgver/chromium-ffmpeg"
  install -Dm644 libffmpeg.so "$pkgdir/usr/lib/opera-beta/lib_extra/libffmpeg.so"
}
