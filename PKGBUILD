# Maintainer: Max Ferrer <maxi.fg13 at gmail dot com>

pkgname="beamwallet-bin"
pkgver=2.2.5635
pkgrel=1
pkgdesc="Scalable confidential cryptocurrency"
arch=("x86_64")
url="https://www.beam.mw"
license=("custom:beam")
makedepends=("binutils" "tar")
source=("Beam-Wallet-2.2.5635.deb::https://builds.beam.mw/mainnet/2019.07.01/Release/linux/Beam-Wallet-2.2.5635.deb")
sha256sums=("0e9f91481240e8d911695e341cafd0d9a7aeec26c8d15728d9b89080d7074246")

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
