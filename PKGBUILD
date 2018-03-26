# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="vdetelweb"

pkgname="$_pkgname-git"
pkgver=1.2.1
pkgrel=1
pkgdesc="Telnet and WEB interface for VDE2"
arch=(any)
url="https://github.com/virtualsquare/vdetelweb"
license=('GPL2')
groups=('view-os')
depends=('liblwipv6-dev' 'mhash')
#makedepends=()
#optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
backup=('etc/vde/vdetelwebrc')
#options=()
#install=
#changelog=
source=("git+https://github.com/virtualsquare/$_pkgname.git")
#noextract=()
md5sums=('SKIP')

build() {
  cd "$_pkgname"
  
  autoreconf -i
  ./configure --prefix="/usr"  --sysconfdir="/etc"
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
