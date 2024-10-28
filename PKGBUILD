# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: maz-1 <ohmygod19993@gmail.com>

pkgname=deadbeef-optimfrog-git
pkgver=r3.1811839
pkgrel=1
epoch=1
pkgdesc="OptimFROG input plugin for DeaDBeeF "
arch=(x86_64 i686)
url="https://github.com/cspiegel/deadbeef-optimfrog"
license=(BSD-2-Clause)
depends=(deadbeef optimfrog)
makedepends=(git)
source=("git+https://github.com/cspiegel/deadbeef-optimfrog.git")
sha256sums=('SKIP')

pkgver() {
  cd "deadbeef-optimfrog"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "deadbeef-optimfrog"
  make
}

package() {
  cd "deadbeef-optimfrog"
  install -Dm 755 cas_ofr.so "$pkgdir/usr/lib/deadbeef/cas_ofr.so"
  install -D copyright.c -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
