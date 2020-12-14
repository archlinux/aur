# Maintainer: Јован Ђокић-Шумарац <sumarac@protonmail.com>
pkgname=fetchy-git
pkgver=1.0.r.
pkgrel=1
epoch=
pkgdesc="Cli system info tool written in C. "
arch=(x86_64)
url="https://gitlab.com/vojjvoda/fetchy.git"
license=('MIT')
groups=()
depends=()
makedepends=(make)
checkdepends=()
optdepends=()
provides=(fetchy)
conflicts=(fetchy)
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
	cd fetchy
	make 
}


package() {
  cd fetchy
 make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/fetch/LICENSE"
  
}


