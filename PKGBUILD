# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=66.0.3359.139
pkgver2=0ubuntu0.18.04.3
pkgrel=0
pkgdesc="Prebuilt ffmpeg-codecs package for vivaldi"
arch=("x86_64")
url="https://packages.ubuntu.com/bionic/amd64/chromium-codecs-ffmpeg-extra/download"
license=('LGPL')
depends=('vivaldi')
provides=(
  'vivaldi-ffmpeg-codecs'
)
conflicts=(
  'vivaldi-ffmpeg-codecs'
)
source=(
  "http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${pkgver2}_amd64.deb"
)
md5sums=("bae1a91a198928c43e5838c57838adf5")

prepare() {
  cd "$srcdir"
  tar -xJf data.tar.xz
}

package() {
  install -Dm644 "$srcdir/usr/lib/chromium-browser/libffmpeg.so" "$pkgdir/opt/vivaldi/libffmpeg.so"
}

