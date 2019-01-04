# Maintainer: Max Ferrer <maxi.fg13 at gmail dot com>

pkgname="beamwallet-bin"
pkgver=1.0.3976
pkgrel=1
pkgdesc="Scalable confidential cryptocurrency"
arch=("x86_64")
url="https://www.beam.mw"
license=("custom:beam")
makedepends=("binutils" "tar")
source=("Beam-Wallet-1.0.3976.deb::https://builds.beam.mw/mainnet/2019.01.03/Release/linux/Beam-Wallet-1.0.3976.deb")
sha256sums=("ac5fce080df0a21ede3d13bd5a8366374be969ceeab6bb685a224385f1b14adc")

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
