# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="vdeplug4"

pkgname="$_pkgname-git"
pkgver=0.1
pkgrel=1
pkgdesc="VDE: Virtual Distributed Ethernet. Plug your VM directly to the cloud"
arch=(any)
url="https://github.com/rd235/vdeplug4"
license=('GPL2')
groups=('view-os')
depends=('libs2argv-execs-git')
#makedepends=()
#optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
#backup=()
#options=()
#install=
#changelog=
source=("git+https://github.com/rd235/$_pkgname.git")
#noextract=()
md5sums=('SKIP')

build() {
  cd "$_pkgname"
  
  autoreconf -i
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
