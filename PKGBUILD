# Maintainer: Volodymyr Zolotopupov <zvova7890@gmail.com>

pkgname=ddflash-git
pkgver=r4.ac32f67
pkgrel=1
pkgdesc='Write USB flash drives without 12309'
arch=(x86_64)
url='https://github.com/zvova7890/ddflash'
license=(MIT)
depends=(util-linux)
makedepends=(git)
source=(git+https://github.com/zvova7890/ddflash.git)
sha256sums=('SKIP')

pkgver() {
  cd ddflash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ddflash
  make
}

package() {
  cd ddflash
  install -Dm755 "ddflash" "$pkgdir/usr/bin/ddflash"
}
