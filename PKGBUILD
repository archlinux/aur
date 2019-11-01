# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=78.0.3904.70
pkgver2=0
pkgrel=1
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
  "http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${pkgver2}ubuntu1_amd64.deb"
)
md5sums=("d07bfc6ef6290021e89e23cbe2f293e2")

prepare() {
  cd "$srcdir"
  tar -xJf data.tar.xz
}

package() {
  install -Dm644 "$srcdir/usr/lib/chromium-browser/libffmpeg.so" "$pkgdir/opt/vivaldi/libffmpeg.so"
}

