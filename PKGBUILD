# Maintainer: Matthew Zilvar <mattzilvar@gmail.com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi-codecs-ffmpeg-extra-bin/

pkgname=vivaldi-codecs-ffmpeg-extra-bin-arm64
pkgver=75.0.3770.90
pkgrel=0
ubuntuver=0.18.10.1
pkgdesc="Prebuilt ffmpeg-codecs package for vivaldi for rpi"
arch=('aarch64')
url="https://packages.ubuntu.com/zesty/armhf/chromium-codecs-ffmpeg-extra/download"
license=('LGPL')
depends=('vivaldi-arm64')
provides=(
  'vivaldi-ffmpeg-codecs'
)
conflicts=(
  'vivaldi-ffmpeg-codecs'
)
source=(http://ports.ubuntu.com/ubuntu-ports/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${pkgrel}ubuntu${ubuntuver}_arm64.deb
        vivaldi-codecs-ffmpeg-extra-bin.install)
sha256sums=('151044fd6e633c50279ea4e62d816c6e5179726f2e9a0740a8bbca76a1c6ebf1'
            'c48d913c6080dbc6477d1d0a099c8ef5eda3959ed4abd6311dc93a338ce0a012'
)
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
