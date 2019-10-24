# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

pkgname=elm-platform-bin
_pkgname=elm-platform

pkgver=0.19.1
pkgrel=1
pkgdesc="Bundle of all core development tools for Elm"
url="https://github.com/elm/compiler"
license=('BSD-3-Clause')
arch=('x86_64')
depends=(ncurses5-compat-libs)
conflicts=(elm-platform)
provides=(elm-platform)
makedepends=()
pkgbinary=${pkgname}-${pkgver}

source=(${pkgbinary}.gz::https://github.com/elm/compiler/releases/download/${pkgver}/binary-for-linux-64-bit.gz)
sha256sums=('e44af52bb27f725a973478e589d990a6428e115fe1bb14f03833134d6c0f155c')

package() {
  install -d $pkgdir/usr/bin
  install -m755 ${pkgbinary} $pkgdir/usr/bin/elm
}
