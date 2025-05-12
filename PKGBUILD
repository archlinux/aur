# Maintainer: tarball <bootctl@gmail.com>

pkgname=bunnymodxt-bin
pkgver=2024.11.11
_ver=nov-11-2024
pkgrel=1
pkgdesc='Speedrun and TAS tool for Half-Life & friends'
url='https://github.com/YaLTeR/BunnymodXT'
arch=(x86_64)
license=(MIT)
provides=(bunnymodxt)
conflicts=(bunnymodxt)
depends=(
  bash
  lib32-gcc-libs
  lib32-glibc
  lib32-libglvnd
)
install=$pkgname.install

source=(bunnymodxt.sh)
source_x86_64=("$pkgname-$pkgver.7z::$url/releases/download/$_ver/2-BunnymodXT-Linux.7z")

sha256sums=('94e2930d1d3f3c71c4dd23b9d2b46a80eb35f02ffefaae521b1197eef7304446')
sha256sums_x86_64=('ee45dab4859a3abfb8aef139899f908adff2de03f4c02235ce28bfcc5ad9f0b5')

package() {
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 libBunnymodXT.so \
    "$pkgdir"/usr/lib/libBunnymodXT.so

  install -Dm755 bunnymodxt.sh \
    "$pkgdir"/usr/bin/bunnymodxt
}
