# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi-codecs-ffmpeg-extra-bin/

pkgname=vivaldi-codecs-ffmpeg-extra-bin-rpi
pkgver=83.0.4103.61
pkgrel=2
_ubuntuver=0.18.04.1
pkgdesc="Prebuilt ffmpeg-codecs package for Vivaldi for armv6h/armv7h"
arch=('armv6h' 'armv7h')
url="https://packages.ubuntu.com/bionic/armhf/chromium-codecs-ffmpeg-extra/download"
license=('LGPL')
depends=('vivaldi-rpi')
provides=(
  'vivaldi-ffmpeg-codecs'
)
conflicts=(
  'vivaldi-ffmpeg-codecs'
)
source=(http://ports.ubuntu.com/ubuntu-ports/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-0ubuntu${_ubuntuver}_armhf.deb
	vivaldi-codecs-ffmpeg-extra-bin.install)
sha256sums=('5789ce577bdec697c1c68bc7385a720ac65ce99d819576448be77baba89080d2'
            'c48d913c6080dbc6477d1d0a099c8ef5eda3959ed4abd6311dc93a338ce0a012')
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
