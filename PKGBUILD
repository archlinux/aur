# Maintainer: queenbiscuit311 <sarahacv6002 At gmail Dot com>
# I don't know where the libffmpeg version numbers in this snap come from

pkgname=opera-developer-ffmpeg-codecs-bin
pkgver=118887
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera-developer, extracted directly from the chromium-ffmpeg snap"
arch=('x86_64')
url="https://snapcraft.io/chromium-ffmpeg/"
options=('!debug')
license=('LGPL2.1')
depends=('opera-developer')
provides=('opera-developer-ffmpeg-codecs')
conflicts=('opera-developer-ffmpeg-codecs')
makedepends=('7zip')
source=(
  "https://api.snapcraft.io/api/v1/snaps/download/XXzVIXswXKHqlUATPqGCj2w2l7BxosS8_69.snap"
)
sha512sums=('2b4bbb266e435b461dc7b34920f68792c79c661c43a99dd16eb869e0b666038ec03977125f6c854a4eb1d509964e8d676f3ddf62beab67900d53cded40c4b9c7')

prepare() {
  7z x XXzVIXswXKHqlUATPqGCj2w2l7BxosS8_69.snap -oextract
}

package() {
  cd "$srcdir/extract/chromium-ffmpeg-$pkgver/chromium-ffmpeg"
  install -Dm644 libffmpeg.so "$pkgdir/usr/lib/opera-developer/lib_extra/libffmpeg.so"
}
