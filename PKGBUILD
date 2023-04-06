# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=butteraugli-git
pkgver=r36.g71b18b6
pkgrel=1
pkgdesc="A tool for measuring perceived differences between images"
arch=('i686' 'x86_64')
url="https://github.com/google/butteraugli"
license=('Apache')
depends=('glibc' 'libjpeg' 'libpng')
makedepends=('git')
provides=("butteraugli=$pkgver")
conflicts=('butteraugli')
source=("git+https://github.com/google/butteraugli.git")
sha256sums=('SKIP')


pkgver() {
  cd "butteraugli"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "butteraugli"

  make \
    --directory="butteraugli"
}

package() {
  cd "butteraugli"

  install -d "$pkgdir/usr"
  install -Dm755 "butteraugli/butteraugli" -t "$pkgdir/usr/bin"
}
