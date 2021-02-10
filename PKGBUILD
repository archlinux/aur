# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgver=2.09.03
pkgrel=3
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
source_x86_64=($pkgname-$pkgver-x86_64.deb::https://deconz.dresden-elektronik.de/ubuntu/stable/$pkgname-$pkgver-qt5.deb)
source_armv6h=($pkgname-$pkgver-armv6h.deb::https://deconz.dresden-elektronik.de/raspbian/stable/$pkgname-$pkgver-qt5.deb)
source_armv7h=($pkgname-$pkgver-armv7h.deb::https://deconz.dresden-elektronik.de/raspbian/stable/$pkgname-$pkgver-qt5.deb)
source_aarch64=(${pkgname}_${pkgver}-debian-stretch-stable_arm64.deb::https://deconz.dresden-elektronik.de/debian/stable/${pkgname}_${pkgver}-debian-stretch-stable_arm64.deb)
noextract=()
sha256sums_x86_64=('23932a2863eedcf4e0d84ba177cc43b361c92d6b2a16e6481db4a9b7864ac761')
sha256sums_armv6h=('86a012ab674f282fa3567bcdd0bcb9195ef8f7ebb484236e1b7296e39ba6915b')
sha256sums_armv7h=('86a012ab674f282fa3567bcdd0bcb9195ef8f7ebb484236e1b7296e39ba6915b')
sha256sums_aarch64=('e845d8a173a0fba75347dfe144798d69f66e05e3670004b8cfc89ad79b35fbd5')

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  cp -rfv "${pkgdir}/lib" "${pkgdir}/usr"
  rm -rf "${pkgdir}/lib"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}
