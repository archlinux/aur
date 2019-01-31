# Maintainer: Max Ferrer <maxi.fg13 at gmail dot com>

pkgname="beamwallet-bin"
pkgver=1.1.4202
pkgrel=1
pkgdesc="Scalable confidential cryptocurrency"
arch=("x86_64")
url="https://www.beam.mw"
license=("custom:beam")
makedepends=("binutils" "tar")
source=("Beam-Wallet-1.1.4202.deb::https://builds.beam.mw/mainnet/2019.01.21/Release/linux/Beam-Wallet-1.1.4202.deb")
sha256sums=("0ec92fb64d45a631f8305ec0eb2988460713d6c2bb3e6ce1b80e8008906ea02a")

prepare() {
  tar xf control.tar.gz
}

pkgver() {
  cat control | head -n 2 | tail -n 1 | cut -d' ' -f 2
}

package() {
  tar xf data.tar.gz -C "${pkgdir}/"
  _desktop_file=${pkgdir}/usr/share/applications/beam.desktop
}

# vim:set ts=2 sw=2 et:
