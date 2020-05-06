# Maintainer: Benjamin Feakins <hidden>
# Maintainer: Felix Golatofski <hidden>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi-codecs-ffmpeg-extra-bin/

pkgname=vivaldi-codecs-ffmpeg-extra-bin-arm64
pkgver=81.0.4044.129
pkgrel=1
pkgdesc='Prebuilt ffmpeg-codecs package for Vivaldi for arm64'
arch=('aarch64')
url='https://packages.ubuntu.com/groovy/arm64/chromium-codecs-ffmpeg-extra/download'
license=('LGPL')
depends=('vivaldi-arm64')
provides=(
  'vivaldi-ffmpeg-codecs'
)
conflicts=(
  'vivaldi-ffmpeg-codecs'
)
source=(http://ports.ubuntu.com/ubuntu-ports/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-0ubuntu1_arm64.deb
        vivaldi-codecs-ffmpeg-extra-bin.install)
sha256sums=('3027823d4f96be52f6ad6eebb48452efab3e86e1a05c9a09a3745d416e38176a'
            '7ded5edc0c45ab69a0d192124f437094dd90e858dceaaa649ee67325c128a290')
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
