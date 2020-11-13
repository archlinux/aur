# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgver=2.05.86
pkgrel=2
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
sha256sums_x86_64=('028ea8f951bd7604837ef8ea4764abd17f88ec062b320c6a07a20548229cd9bb')
sha256sums_armv6h=('f9964d244516bac01f9b744119f23d3cbe332bce1f7030cf1d32f8de49a4e901')
sha256sums_armv7h=('f9964d244516bac01f9b744119f23d3cbe332bce1f7030cf1d32f8de49a4e901')
sha256sums_aarch64=('64cf0e4d18d34f5ef17915446308c3c787d55a9439f3b88edfbbc49ece82d11e')

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  cp -rfv "${pkgdir}/lib" "${pkgdir}/usr"
  rm -rf "${pkgdir}/lib"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}
