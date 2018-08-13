# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-beetle-wswan-git
pkgver=r712.b4dc85b
pkgrel=1
pkgdesc='WonderSwan core'
arch=('x86_64')
url='https://github.com/libretro/beetle-wswan-libretro'
license=('GPL2')
groups=('libretro-unstable')
depends=('libretro-core-info')
makedepends=('git')
provides=('libretro-beetle-wswan' 'libretro-mednafen-wswan-git')
conflicts=('libretro-beetle-wswan' 'libretro-mednafen-wswan-git')
source=("libretro-beetle-wswan::git+https://github.com/libretro/beetle-wswan-libretro.git")
sha256sums=('SKIP')

pkgver() {
  cd libretro-beetle-wswan

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  make -C libretro-beetle-wswan
}

package() {
  install -Dm 644 libretro-beetle-wswan/mednafen_wswan_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
