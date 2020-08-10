# Maintainer: Benjamin Feakins <hidden>
# Maintainer: Felix Golatofski <hidden>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi-codecs-ffmpeg-extra-bin/

pkgname=vivaldi-codecs-ffmpeg-extra-bin-arm64
pkgver=84.0.4147.105
pkgrel=1
_ubuntuver=18.04.1
pkgdesc='Prebuilt ffmpeg-codecs package for Vivaldi for arm64'
arch=('aarch64')
url='https://packages.ubuntu.com/bionic/arm64/chromium-codecs-ffmpeg-extra/download'
license=('LGPL')
depends=('vivaldi-arm64')
provides=(
  'vivaldi-ffmpeg-codecs'
)
source=(http://ports.ubuntu.com/ubuntu-ports/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-0ubuntu0.${_ubuntuver}_arm64.deb
        vivaldi-codecs-ffmpeg-extra-bin.install)
sha256sums=('2b0a4b05dc8a1daa640ecc310b8618e5cfbbb62d0934c1db2bcaf51f0871c526'
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
