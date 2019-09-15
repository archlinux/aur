# Maintainer: Max Ferrer <maxi.fg13 at gmail dot com>

pkgname="beamwallet-bin"
pkgver=Scalable
pkgrel=3
pkgdesc="Scalable confidential cryptocurrency"
arch=("x86_64")
url="https://www.beam.mw"
license=("custom:beam")
makedepends=("binutils" "tar")
source=("Beam-Wallet-3.1.5765.deb::https://builds.beam.mw/mainnet/2019.08.08/Release/linux/Beam-Wallet-3.1.5765.deb")
sha256sums=("816f5b952b36fb5283f90ec693ff1fdd5f4c9038681024b97b4b3104fd27ac73")

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
