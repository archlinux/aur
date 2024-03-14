# Maintainer: Nico Domino <yo at ndo dot dev>
pkgname=('rose-pine-cursor-hyprcursor')
pkgbase=rose-pine-cursor-hyprcursor
pkgver=v0.2.0.r0.g795c63a
pkgrel=2
arch=('any')
url="https://github.com/ndom91/rose-pine-cursor-hyprcursor"
license=('GPL-3.0-or-later')
makedepends=('git')
source=('git+https://github.com/ndom91/rose-pine-cursor-hyprcursor')
sha256sums=('SKIP')

pkgver() {
  cd rose-pine-cursor-hyprcursor || return
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd rose-pine-cursor-hyprcursor || return
  install -d "$pkgdir/usr/share/icons/rose-pine-cursor-hyprcursor"
  cp -ar --no-preserve=ownership \
    hyprcursors \
    manifest.hl \
    "$pkgdir/usr/share/icons/rose-pine-cursor-hyprcursor"
}
