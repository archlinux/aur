# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgver=2.07.00
pkgrel=1
pkgdesc="A generic ZigBee monitoring and control tool"
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
source_x86_64=($pkgname-$pkgver-x86_64.deb::https://deconz.dresden-elektronik.de/ubuntu/beta/$pkgname-$pkgver-qt5.deb)
source_armv6h=($pkgname-$pkgver-armv6h.deb::https://deconz.dresden-elektronik.de/raspbian/beta/$pkgname-$pkgver-qt5.deb)
source_armv7h=($pkgname-$pkgver-armv7h.deb::https://deconz.dresden-elektronik.de/raspbian/beta/$pkgname-$pkgver-qt5.deb)
source_aarch64=(${pkgname}_${pkgver}-debian-stretch-beta_arm64.deb::https://deconz.dresden-elektronik.de/debian/beta/${pkgname}_${pkgver}-debian-stretch-beta_arm64.deb)
noextract=()
sha256sums_x86_64=('4ecde70ce0db498ead1ad864563a919e83a4b493d0c3d1dc3b36790f5ec2143e')
sha256sums_armv6h=('49f1f30c925eeffeae2b8a7341e321f4883d930fde1bb88a6d478e2787348bb7')
sha256sums_armv7h=('49f1f30c925eeffeae2b8a7341e321f4883d930fde1bb88a6d478e2787348bb7')
sha256sums_aarch64=('5e481da65781d2dae9be725114b83116cea78b5c10ddd40706da0058b516a4c8')

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  cp -rfv "${pkgdir}/lib" "${pkgdir}/usr"
  rm -rf "${pkgdir}/lib"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}
