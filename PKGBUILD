# Maintainer: Max Ferrer <maxi.fg13 at gmail dot com>

pkgname="beamwallet-bin"
pkgver=2.1.4915
pkgrel=1
pkgdesc="Scalable confidential cryptocurrency"
arch=("x86_64")
url="https://www.beam.mw"
license=("custom:beam")
makedepends=("binutils" "tar")
source=("Beam-Wallet-2.1.4915.deb::https://builds.beam.mw/mainnet/2019.05.27/Release/linux/Beam-Wallet-2.1.4915.deb")
sha256sums=("4714018b5273f1f3f7fbd9ae5d53f0e1c01f52b846e63a14ca65bdf8faa149ff")

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
