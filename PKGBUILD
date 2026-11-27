# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=libretro-gearsystem
pkgver=3.9.26
pkgrel=1
epoch=1
pkgdesc='Sega Master System/Game Gear/SG-1000 core'
arch=(x86_64)
url=https://github.com/drhelius/Gearsystem
license=(GPL-3.0-or-later)
groups=(libretro)
depends=(glibc libretro-core-info libstdc++)
makedepends=(git)
source=("${pkgname}::git+https://github.com/drhelius/Gearsystem.git#tag=${pkgver}")
sha256sums=('fe61f4a063942993e8a048c9153286eacd5b3a294b437da16e4a48697e774358')

build() {
  make -C "${pkgname}/platforms/libretro"
}

package() {
  cd "$pkgname"
  install -Dm644 platforms/libretro/gearsystem_libretro.so -t "${pkgdir}/usr/lib/libretro/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
