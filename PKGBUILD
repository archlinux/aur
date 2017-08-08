# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=archisomod-git
pkgver=r37.3491ee5
pkgrel=1
pkgdesc='Python script to remaster Arch Linux ISOs with option to add 32-bit EFI'
arch=('any')
url='https://github.com/HOMEINFO/archiso-tools'
license=('GPL3')
depends=('python-docopt' 'libisoburn')
optdepends=('grub: 32-bit EFI image generation')
makedepends=('git')
source=('git+https://github.com/HOMEINFO/archiso-tools.git')
sha256sums=('SKIP')

pkgver() {
  cd archiso-tools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 archiso-tools/archisomod "$pkgdir"/usr/bin/archisomod
}
