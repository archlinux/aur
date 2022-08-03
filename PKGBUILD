# Maintainer: Ricardo Gonçalves <ricardompgoncalves at gmail dot com>
pkgname=disk-benchmark
pkgver=r19.a82f4e7
pkgrel=1
pkgdesc="Tool to benchmark disks, devices, filesystems or even files, like CrystalDiskMark but for the command line"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/rigon/disk-benchmark"
license=('GPL3')
makedepends=('git')
source=("git+https://github.com/rigon/disk-benchmark.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  gcc -o $pkgname disk-benchmark.c
}

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
}
