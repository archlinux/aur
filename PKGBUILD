# Maintainer: Thomas Weißschuh <thomas_weissschuh@lavabit.com>

pkgname=taterm
pkgver=8
pkgrel=1
pkgdesc="Terminal emulator for tiling window managers"
arch=('i686' 'x86_64')
url="https://github.com/t-8ch/taterm"
depends=('vte3' 'dbus')
makedepends=('vala')
license=('GPL3')
source=("${pkgname}-${pkgver}::https://github.com/t-8ch/taterm/tarball/v${pkgver}")

build() {
  cd $(ls -1dt ${srcdir}/t-8ch-${pkgname}-* | head -n 1)

  make
}

package() {
  cd $(ls -1dt ${srcdir}/t-8ch-${pkgname}-* | head -n 1)

  install -d ${pkgdir}/usr/bin/
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

}
# vim:set ts=2 sw=2 et:
sha1sums=('431a2c6966a6ba728d3bc5fe4d777c9c8752c849')
