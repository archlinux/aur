# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h')
pkgver=2.05.46
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
source_x86_64=(https://www.dresden-elektronik.de/deconz/ubuntu/beta/$pkgname-$pkgver-qt5.deb)
source_armv6h=(http://www.dresden-elektronik.de/rpi/deconz/beta/$pkgname-$pkgver-qt5.deb)
source_armv7h=(http://www.dresden-elektronik.de/rpi/deconz/beta/$pkgname-$pkgver-qt5.deb)
noextract=()
sha256sums_x86_64=(da9bae83e82a59d5b123383efa9e0d1c5a3902066404e2b4febcad983c9d2580)
sha256sums_armv6h=(1b5bd168b5fcfd17a5b159d2505164acbcb08f408866b5e0788c930363170c05)
sha256sums_armv7h=(1b5bd168b5fcfd17a5b159d2505164acbcb08f408866b5e0788c930363170c05)

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  cp -rfv "${pkgdir}/lib" "${pkgdir}/usr"
  rm -rf "${pkgdir}/lib"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}
