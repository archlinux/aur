# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="vdens"

pkgname="$_pkgname-git"
pkgver=0.1
pkgrel=1
pkgdesc="Create User Namespaces connected to VDE networks"
arch=(any)
url="https://github.com/rd235/$_pkgname"
license=('GPL2')
groups=('view-os')
depends=('vde2' 'libs2argv-execs' 'vdeplug4')
#makedepends=()
#optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
#backup=()
#options=()
install="$_pkgname.install"
#changelog=
source=("git+https://github.com/rd235/$_pkgname.git")
#noextract=()
md5sums=('SKIP')

build() {
  cd "$_pkgname"
  
  autoreconf -i
  ./configure
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
