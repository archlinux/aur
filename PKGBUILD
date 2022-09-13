# Contributor: Julian Daube <joposter (at) gmail (dot) com>
# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz-dev
_channel=beta
arch=('x86_64' 'aarch64')
pkgver=2.18.01
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
sha256sums_x86_64=('54abf81d4019b6dc2f45a254df3404e9d84d7a453102b73f54cf123b053d799b')
sha256sums_aarch64=('24dadfe2241b66ccb98bde514bead2942a8776e78211971b18981976ae62a747')
noextract=()

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"	
  chown -R root:root "${pkgdir}"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}
