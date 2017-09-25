# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=61.0.3163.79
pkgrel=0
pkgdesc="Prebuilt ffmpeg-codecs package for vivaldi"
arch=(
  "x86_64"
)
url="https://packages.ubuntu.com/zesty/amd64/chromium-codecs-ffmpeg-extra/download"
license=('GPL')
depends=('vivaldi')
provides=(
  'vivaldi-ffmpeg-codecs'
)
conflicts=(
  'vivaldi-ffmpeg-codecs'
)
source=(
  "http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${pkgrel}ubuntu0.17.04.1371_amd64.deb"
)
md5sums=(
  "f63fc4df3371d136727d599c7fbc709b"
)

prepare() {
  cd "$srcdir"
  tar -xJf data.tar.xz
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/opt/vivaldi/lib"
  cp "$srcdir/usr/lib/chromium-browser/libffmpeg.so" "$pkgdir/opt/vivaldi/lib/libffmpeg.so"
}
