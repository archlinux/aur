# Maintainer: Matthew Rease <scubaventure101[AT]hotmail[DOT]com>
pkgname=mash-sh
pkgver=0.0
_pkgver='alpha-aur-1' # temporary - when mash begins using semantic versioning this will be removed
pkgrel=2
pkgdesc="A bash/zsh like shell, written in C."
arch=('x86_64' 'aarch64' 'ppc')
url="https://gitlab.com/Magicrafter13/mash"
license=('GPL3')
changelog=
source=("https://gitlab.com/Magicrafter13/mash/-/archive/${_pkgver}/mash-${_pkgver}.tar.gz")
sha256sums=('11824bcad25c7e3662b4c198179b02de2247dc0c897bb407eb00443aefc65366')

build() {
  cd "mash-$_pkgver"

  make -j
}

package() {
  cd "mash-$_pkgver"

  mkdir -p "$pkgdir/usr/bin"
  cp mash "$pkgdir/usr/bin/mash"
}
