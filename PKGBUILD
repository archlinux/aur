# Maintainer: snql <snql DOT by AT gmail DOT com>
# Based on vivaldi-codecs-ffmpeg-extra-bin package <Maintainer: Fahad Hossain>
pkgname=yandex-browser-codecs-ffmpeg-extra-bin
pkgver=63.0.3239.84
pkgrel=1
pkgdesc="Prebuilt ffmpeg-codecs package for yandex.browser"
arch=(
  "x86_64"
)
url="https://packages.ubuntu.com/zesty/amd64/chromium-codecs-ffmpeg-extra/download"
license=('LGPL')
provides=(
  'yandex-browser-ffmpeg-codecs'
)
conflicts=(
  'yandex-browser-ffmpeg-codecs'
)
source=(
  
"http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-0ubuntu0.17.10.${pkgrel}_amd64.deb"
)
md5sums=(
  "62449b377d2c2a8060dce62b4e74ddd3"
)

prepare() {
  cd "$srcdir"
  tar -xJf data.tar.xz
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/opt/yandex/browser-beta"
  cp "$srcdir/usr/lib/chromium-browser/libffmpeg.so" "$pkgdir/opt/yandex/browser-beta/libffmpeg.so"
}

