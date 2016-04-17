# Maintainer: Brin Bidulock <bidulock@openss7.com>
# Contributor: Chuan Ji <jichuan89[at]gmail[dot]com>
pkgname=gatotray-git
_pkgname=gatotray
pkgver=2.3.20.g41b3022
pkgrel=1
pkgdesc="Graphical CPU stats monitor in the system tray."
url="http://code.google.com/p/gatotray/"
arch=('x86_64' 'i686')
license=('CCPL:by')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('gtk2' 'xterm')
makedepends=('git')
source=("$pkgname::git+https://github.com/kafene/$_pkgname.git/")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "2.3.%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  strip gatotray
  install -Dm755 gatotray "${pkgdir}/usr/bin/gatotray"
}

# vim:set ts=2 sw=2 et:
