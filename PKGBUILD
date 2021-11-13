# Maintainer: Dreemurrs Embedded Labs
pkgname=archarm-mobile-fde-installer-git
pkgver=1.0.0
pkgrel=1
pkgdesc='Script to setup Full-Ddisk-Encryption on Arch Linux ARM for PinePhone and PineTab'
arch=('any')
url='https://github.com/dreemurrs-embedded/archarm-mobile-fde-installer'
license=('custom:none')
depends=('git' 'openssl')
optdepends=('gnupg: config import/export support')
source=("git+https://github.com/dreemurrs-embedded/archarm-mobile-fde-installer.git")
sha256sums=('SKIP')
provides=("archarm-mobile-fde-installer=${pkgver}")
depends=(
  'parted'
  'cryptsetup'
  'sudo'
  'wget'
  'tar'
  'squashfs-tools'
  'e2fsprogs'
  'f2fs-tools'
  'util-linux'
  'zstd'
  'curl'
)

package() {
  cd "archarm-mobile-fde-installer/"
  install -m 755 -D installer.sh "${pkgdir}/usr/bin/archarm-mobile-fde-installer"
}
