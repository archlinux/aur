# Author: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=linger-switch
pkgver=1.0
pkgrel=2
pkgdesc="A tool to let user to enable / disable lingering"
url="https://github.com/adrien1018/linger-switch"
arch=('i686' 'x86_64')
provides=('linger-switch')
source=('Makefile' 'linger-switch.cpp')
sha256sums=('ade71a4c53d521a18c37aff2274e7e902deaad411958b3194879ca37c294ceb3' 'de7453dce18dc64a4db9b2e9cb77f27bde8a4480d476aa8e45c8ca88166c346a')

build() {
  cd "$srcdir"
  make
}

package() {
  install -d -m0711 "${pkgdir}/var/lib/systemd/linger"
  install -D -m4755 "$srcdir/linger-switch" "${pkgdir}/usr/bin/linger-switch"
}
