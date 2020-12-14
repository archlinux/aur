# Maintainer: Јован Ђокић-Шумарац <sumarac@protonmail.com>
pkgname=dmenu-vojvoda-git
pkgver=5.0.r.
pkgrel=1
epoch=
pkgdesc="My build of dmenu"
arch=(x86_64)
url="https://gitlab.com/vojjvoda/dmenu"
license=('MIT')
groups=()
depends=(nerd-fonts-mononoki )
makedepends=(make)
checkdepends=()
optdepends=()
provides=(dmenu)
conflicts=(dmenu)
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
  printf "5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd dwm
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}


package() {
  cd dmenu  
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  
}


