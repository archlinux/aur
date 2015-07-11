#Maintainer: Stavros Polymenis <sp orbitalfox.com>
pkgname=yamado-git
pkgver=150708beta
pkgrel=1
pkgdesc="Yamado is a minimal note & journal system with extensions for functioning as a homepage & blog."
arch=(any)
url="http://lc.orbitalfox.com"
license=('AGPL3')
groups=(portal)
depends=(markdown)
makedepends=(git)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/orbifx/yamado.git)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd yamado
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd yamado

#  ./configure --prefix=/usr
  make
}

package() {
  cd yamado
  
  make DESTDIR="$pkgdir" install
}
