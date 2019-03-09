# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=72.0.3626.121
pkgver2=0ubuntu1
pkgrel=0
pkgdesc="Prebuilt ffmpeg-codecs package for vivaldi"
arch=("x86_64")
url="https://packages.ubuntu.com/disco/amd64/chromium-codecs-ffmpeg-extra/download"
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
md5sums=("0150d4d452aa8ff160a84c342c2ba6d6")

prepare() {
  cd "$srcdir"
  tar -xJf data.tar.xz
}

package() {
  install -Dm644 "$srcdir/usr/lib/chromium-browser/libffmpeg.so" "$pkgdir/opt/vivaldi/libffmpeg.so"
}

