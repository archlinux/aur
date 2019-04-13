# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h')
pkgver=2.05.62
pkgrel=1
pkgdesc="A generic ZigBee monitoring and control tool"
url="http://www.dresden-elektronik.de"
license=('custom:"Copyright (c) dresden elektronik ingenieurtechnik GmbH"')
groups=()
depends=('hicolor-icon-theme'
         'libcap'
         'libpng'
         'qt5-base'
         'qt5-serialport'
         'qt5-websockets'
         'sqlite')
makedepends=('xz')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=($pkgname-$pkgver-x86_64.deb::https://www.dresden-elektronik.de/deconz/ubuntu/beta/$pkgname-$pkgver-qt5.deb)
source_armv6h=($pkgname-$pkgver-armv6h.deb::https://www.dresden-elektronik.de/rpi/deconz/beta/$pkgname-$pkgver-qt5.deb)
source_armv7h=($pkgname-$pkgver-armv7h.deb::https://www.dresden-elektronik.de/rpi/deconz/beta/$pkgname-$pkgver-qt5.deb)
noextract=()
sha256sums_x86_64=('7d5423421770ecbac2d14f774e4d88400c8b6e84233f0077b881c3d9de937f56')
sha256sums_armv6h=('5d6c41225e7e29c530a352d576d50630ea50e22691b0945e7516c51d2129223d')
sha256sums_armv7h=('5d6c41225e7e29c530a352d576d50630ea50e22691b0945e7516c51d2129223d')

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  cp -rfv "${pkgdir}/lib" "${pkgdir}/usr"
  rm -rf "${pkgdir}/lib"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}
