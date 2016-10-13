# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=caps2esc
pkgver=1.0
pkgrel=1
pkgdesc="caps2esc: transforming the most useless key ever in the most useful one"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/oblitum/caps2esc"
depends=('libevdev')
makedepends=('gcc')
source=('https://raw.githubusercontent.com/oblitum/caps2esc/v1.0.1/caps2esc.c' 'caps2esc.service')
md5sums=('358312683110f961569a384e2cda86be' 'b522d1654f2d04f703b8409ef4d5e7d0')

build() {
  gcc caps2esc.c -o caps2esc -I/usr/include/libevdev-1.0 -levdev -ludev
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp caps2esc "${pkgdir}/usr/bin"

  mkdir -p "${pkgdir}/etc/systemd/system"
  cp caps2esc.service "${pkgdir}/etc/systemd/system"
}
