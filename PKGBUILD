pkgname=mold-git
pkgver=r1662.fd6de2d
pkgrel=1
pkgdesc='Fast linker'
arch=(x86_64)
url='https://github.com/rui314/mold'
license=('unknown')
depends=(mimalloc)
makedepends=(clang cmake git)
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
  cd mold
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C mold
}

package() {
  install -Dm755 mold/mold "$pkgdir/usr/bin/mold"
}
