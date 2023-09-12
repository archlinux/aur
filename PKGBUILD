# Contributor: Julian Daube <joposter (at) gmail (dot) com>
# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz-dev
_channel=beta
arch=('x86_64' 'aarch64')
pkgver=2.23.00
pkgrel=1
pkgdesc="A generic ZigBee monitoring and control tool (development headers)"
url="https://www.dresden-elektronik.de"
license=('custom:"Copyright (c) dresden elektronik ingenieurtechnik GmbH"')

groups=()
depends=()
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
sha256sums_x86_64=('b96e62177aef165a301613015434ce1e42762b82c1800c710bbf6d5e9321cb95')
sha256sums_aarch64=('1665bae35f1662fde313c815bd707b1cd19c18340ce73e363a95453b40e53bde')
noextract=()

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"	
  chown -R root:root "${pkgdir}"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}

