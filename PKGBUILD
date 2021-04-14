# Maintainer: Popolon <popolon@popolon.org>

pkgname=psgplay-git
_pkgname=psgplay
pkgver=0.3
pkgrel=1
pkgdesc="Music player and emulator for the Atari ST Programmable Sound Generator (PSG) YM2149 and files in the SNDH archive."
arch=('i686' 'x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url="https://github.com/frno7/psgplay"
license=('GPL-2.0' 'LGPL-2.1' 'MIT')
depends=('alsa-lib')
source=("git+https://github.com/frno7/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  make ALSA=1
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 "licence/GPL-2.0" "${pkgdir}/usr/share/licenses/${_pkgname}/GPL-2.0"
  install -Dm644 "licence/LGPL-2.1" "${pkgdir}/usr/share/licenses/${_pkgname}/LGPL-2.1"
  install -Dm644 "licence/MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/MIT"
  install -Dm755 psgplay "${pkgdir}/usr/bin/psgplay"
}

