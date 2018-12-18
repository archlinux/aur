# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=71.0.3578.80
pkgver2=0ubuntu0.18.10.1
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
md5sums=("dbda7eee8b0494bda4eaa2aca6a1e2d9")

prepare() {
  cd "$srcdir"
  tar -xJf data.tar.xz
}

package() {
  install -Dm644 "$srcdir/usr/lib/chromium-browser/libffmpeg.so" "$pkgdir/opt/vivaldi/libffmpeg.so"
}

