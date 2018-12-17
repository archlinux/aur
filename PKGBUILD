# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h')
pkgver=2.05.52
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
sha256sums_x86_64=('42888d85f88482d6f30fc324f1cf766d2e3b61a1d1e760a638f059f60dd428a7')
sha256sums_armv6h=('054e477a46cae0c62f7334d0b8bb5e9a3d2292a20a716b83c2c73e3c587f84e0')
sha256sums_armv7h=('054e477a46cae0c62f7334d0b8bb5e9a3d2292a20a716b83c2c73e3c587f84e0')

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  cp -rfv "${pkgdir}/lib" "${pkgdir}/usr"
  rm -rf "${pkgdir}/lib"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}
