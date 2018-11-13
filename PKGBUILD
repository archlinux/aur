# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h')
pkgver=2.05.47
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
sha256sums_x86_64=(1164d7afe186bbaf62a4755b27124c6d380273d5a4e48e4fc57f0bb2305bc836)
sha256sums_armv6h=(56b0b3e39b3dce02180209e1812d935f9de69efb6bf8ab4b215a53b278f1831)
sha256sums_armv7h=(56b0b3e39b3dce02180209e1812d935f9de69efb6bf8ab4b215a53b278f1831)

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  cp -rfv "${pkgdir}/lib" "${pkgdir}/usr"
  rm -rf "${pkgdir}/lib"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}
