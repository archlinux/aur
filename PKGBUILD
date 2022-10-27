# Maintainer: Matthew Rease <scubaventure101[AT]hotmail[DOT]com>
pkgname=mash-sh
pkgver=0.0
_pkgver='alpha-aur-2' # temporary - when mash begins using semantic versioning this will be removed
pkgrel=3
pkgdesc="A bash/zsh like shell, written in C."
arch=('x86_64' 'aarch64' 'ppc')
url="https://gitlab.com/Magicrafter13/mash"
license=('GPL3')
changelog=
source=("https://gitlab.com/Magicrafter13/mash/-/archive/${_pkgver}/mash-${_pkgver}.tar.gz")
sha256sums=('0852441a480a6e48b3b97f6c5933f44aa968bf6275b1c838065bc06ab2e3b7e4')

build() {
  cd "mash-$_pkgver"

  make -j
}

package() {
  cd "mash-$_pkgver"

  mkdir -p "$pkgdir/usr/bin"
  cp mash "$pkgdir/usr/bin/mash"
}
