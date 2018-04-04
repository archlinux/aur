# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

pkgname=elm-platform-bin
_pkgname=elm-platform

pkgver=0.18.0
pkgrel=1
pkgdesc="Bundle of all core development tools for Elm"
url="https://github.com/elm-lang/elm-platform"
license=('BSD-3-Clause')
arch=('x86_64')
depends=(ncurses5-compat-libs)
makedepends=()

source=(elm-platform-${pkgver}.tar.gz::https://dl.bintray.com/elmlang/elm-platform/${pkgver}/linux-x64.tar.gz)
sha512sums=('aa0e95e1bfacff06181d85c3dd7635b60dfc8f563d22bf8db952f11d03cef46756ba90318df9e236c51031e522ef1769da01d0709751de10fe4fc83440b01f48')

package() {
  cd "$srcdir/dist_binaries"
  install -d $pkgdir/usr/bin
  install -m755 elm $pkgdir/usr/bin/elm
  install -m755 elm-make $pkgdir/usr/bin/elm-make
  install -m755 elm-package $pkgdir/usr/bin/elm-package
  install -m755 elm-reactor $pkgdir/usr/bin/elm-reactor
  install -m755 elm-repl $pkgdir/usr/bin/elm-repl
}
