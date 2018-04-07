# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=65.0.3325.181
pkgrel=1
pkgdesc="Prebuilt ffmpeg-codecs package for vivaldi"
arch=(
  "x86_64"
)
url="https://packages.ubuntu.com/artful/amd64/chromium-codecs-ffmpeg-extra/download"
license=('LGPL')
depends=('vivaldi')
provides=(
  'vivaldi-ffmpeg-codecs'
)
conflicts=(
  'vivaldi-ffmpeg-codecs'
)
source=(
  "http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-0ubuntu0.17.10.${pkgrel}_amd64.deb"
)
md5sums=(
  "4c306a3b6dcdc4fd2c510a5a734bf57b"
)

prepare() {
  cd "$srcdir"
  tar -xJf data.tar.xz
}

package() {
  install -Dm644 "$srcdir/usr/lib/chromium-browser/libffmpeg.so" "$pkgdir/opt/vivaldi/libffmpeg.so"
}

