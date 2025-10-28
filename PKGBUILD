# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=libudev0-shim
pkgver=2
pkgrel=2
pkgdesc='libudev.so.0 compatibility library for systems with newer udev versions'
url='https://github.com/archlinux/libudev0-shim'
arch=('x86_64')
license=('LGPL-2.1-or-later')
provides=('libudev0')
conflicts=('libudev0')
depends=('systemd-libs')
makedepends=('git')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D') # Emil Velikov <emil.l.velikov@gmail.com>
source=("git+https://github.com/archlinux/libudev0-shim.git#tag=v${pkgver}?signed")
sha512sums=('eb77f1af1079a9c2dc0cd34a8a29ccffba012a4cf2f947b0ab2d669e98ee94c3e3c43aba73cfa29feb54422e4f0caa7022a5d15a7012fb57651e5a72a2d39f10')

build() {
  cd "${pkgname}"

  make
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install
}
