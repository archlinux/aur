# Maintainer: tarball <bootctl@gmail.com>

pkgname=bunnymodxt-bin
pkgver=2023.07.23
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
source_x86_64=("$pkgname-$pkgver.7z::$url/releases/download/jul-23-2023/2-BunnymodXT-Linux.7z")

sha256sums=('94e2930d1d3f3c71c4dd23b9d2b46a80eb35f02ffefaae521b1197eef7304446')
sha256sums_x86_64=('ecfd9065ed426f4892bc8375fe7c76f5e0d8f59fb617316ea0bfc94fe95e07a7')

package() {
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 libBunnymodXT.so \
    "$pkgdir"/usr/lib/libBunnymodXT.so

  install -Dm755 bunnymodxt.sh \
    "$pkgdir"/usr/bin/bunnymodxt
}
