# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
pkgname=yabsnap-git
pkgver=r60.78bf3e5
pkgrel=1
pkgdesc="Btrfs automated snapshot manager."
arch=('any')
url="https://github.com/hirak99/yabsnap"
license=('Apache')
depends=('python3')
makedepends=('rsync')
provides=("yabsnap=${pkgver}")
conflicts=('yabsnap')
source=("$pkgname::git+https://github.com/hirak99/yabsnap")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$pkgname"
  src/run_tests.sh
}

package() {
  cd "$pkgname"
  scripts/install-to-dest.sh "$pkgdir"
}

