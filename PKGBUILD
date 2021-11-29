# Contributor: Julian Daube <joposter (at) gmail (dot) com>
# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz-dev
_channel=beta
arch=('x86_64' 'aarch64')
pkgver=2.13.02
pkgrel=1
pkgdesc="A generic ZigBee monitoring and control tool (development headers)"
url="https://www.dresden-elektronik.de"
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
source_x86_64=($pkgname-$pkgver-x86_64.deb::https://deconz.dresden-elektronik.de/ubuntu/$_channel/$pkgname-$pkgver.deb)
source_aarch64=(${pkgname}_${pkgver}-debian-stretch-stable_arm64.deb::https://deconz.dresden-elektronik.de/debian/$_channel/${pkgname}_${pkgver}-debian-buster-${_channel}_arm64.deb)
sha256sums_x86_64=('38d19613462e618b3774d56f019f89d50beadc8d053d028fd84e85540a70fb37')
sha256sums_aarch64=('1b41cd6c251d1c9754cddb5786ea069c17d6680ee35587c478260fb187bddf97')
noextract=()

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"	
  chown -R root:root "${pkgdir}"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}
