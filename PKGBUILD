# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi-codecs-ffmpeg-extra-bin/

pkgname=vivaldi-codecs-ffmpeg-extra-bin-rpi
pkgver=71.0.3578.98
pkgrel=1
pkgdesc="Prebuilt ffmpeg-codecs package for vivaldi for rpi"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://packages.ubuntu.com/zesty/armhf/chromium-codecs-ffmpeg-extra/download"
license=('LGPL')
depends=('vivaldi')
provides=(
  'vivaldi-ffmpeg-codecs'
)
conflicts=(
  'vivaldi-ffmpeg-codecs'
)
source=(
  "http://ports.ubuntu.com/ubuntu-ports/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-0ubuntu0.18.10.${pkgrel}_armhf.deb"
)
md5sums=('b3a36bb8e036855f219d2b82a54a2691')
install=vivaldi-codecs-ffmpeg-extra-bin.install

prepare() {
  cd "$srcdir"
  tar -xJf data.tar.xz
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/vivaldi-codecs"
  cp "$srcdir/usr/lib/chromium-browser/libffmpeg.so" "$pkgdir/usr/share/vivaldi-codecs/libffmpeg.so"
}

