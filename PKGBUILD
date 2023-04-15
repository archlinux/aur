# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
pkgname=yabsnap
pkgver=2.0.1
pkgrel=1
pkgdesc="Btrfs automated snapshot manager."
arch=('any')
url="https://github.com/hirak99/yabsnap"
license=('Apache')
# Dependencies -
# btrfs-progs: Required for btrfs operations. May change if we extend into rsync
#   rsync based options.
# coreutils: For stat. Should be part of base.
#   Opinion is split on whether to include coreutils, err on including it.
# python3: Runtime. Typically present in a base install.
depends=('btrfs-progs' 'coreutils' 'python3')
makedepends=('rsync')
provides=('yabsnap')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('d0a8d4d85870f3dc0d219e273160f278')

check() {
  cd "$pkgname"-$pkgver
  src/run_tests.sh
}

package() {
  cd "$pkgname"-$pkgver
  scripts/install-to-dest.sh "$pkgdir"
}

