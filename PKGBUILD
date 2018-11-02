# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h')
pkgver=2.05.45
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
sha256sums_x86_64=(9b1f34436e3234f357238258f085935080705007e77c6378695504c81713845e)
sha256sums_armv6h=(3a73df027a99f982b76ff5bb4fc044a3926bd933a27a65faa940049a71bb48f4)
sha256sums_armv7h=(3a73df027a99f982b76ff5bb4fc044a3926bd933a27a65faa940049a71bb48f4)

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  cp -rfv "${pkgdir}/lib" "${pkgdir}/usr"
  rm -rf "${pkgdir}/lib"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}
