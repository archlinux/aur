# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64')
pkgver=2.05.16
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
source=(https://www.dresden-elektronik.de/deconz/ubuntu/beta/$pkgname-$pkgver-qt5.deb)
noextract=()
sha256sums=(e75c7bb2ce38521ff3afdc5d6c636d7c8819a590d6b98e10501f72aca1124da5)

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}
