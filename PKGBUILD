# Maintainer: Јован Ђокић-Шумарац <sumarac@protonmail.com>
pkgname=dwmblocks-vojvoda-git
pkgver=1.0.r.
pkgrel=1
epoch=
pkgdesc="My build of dwmblocks for my dwm"
arch=(x86_64)
url="https://gitlab.com/vojjvoda/dwmblocks.git"
license=('MIT')
groups=()
depends=(acpi ripgrep dwm-vojvoda-git)
#dmenu-vojvoda dwmblocks-vojvoda
makedepends=(make)
checkdepends=()
optdepends=()
provides=(dwmblocks)
conflicts=(dwmblocks)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd dwmblocks
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}


package() {
  cd dwmblocks  
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  
}


