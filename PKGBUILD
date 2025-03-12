pkgname=libmcfg_2-git
pkgver=0.4.2
pkgrel=2
arch=(x86_64)
url="https://github.com/FelixEcker/mcfg_2"
license=(BSD-3-Clause)
pkgdesc="Parsing library for MCFG/2"
makedepends=(
    git
)
source=("git+https://github.com/FelixEcker/mcfg_2.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgbase"
  cd mcfg_2
  bash scripts/setup.bash
}

build() {
  cd "$_pkgbase"
  cd mcfg_2
  bash scripts/build.bash
}

package() {
  cd "$_pkgbase"
  cd mcfg_2

  install -Dm 755 ./libmcfg_2.a $pkgdir/usr/lib/libmcfg_2.a

  for header in include/*; do
    install -Dm644 $header $pkgdir/usr/$header
  done
}
