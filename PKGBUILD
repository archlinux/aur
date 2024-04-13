#Maintainer: Bartłomiej Szostak <kapcioszek2137@gmail.com>
pkgname=fremen-transcriptor-git
pkgver=1.0
pkgrel=7
pkgdesc="Sofware to transcript ASCII into desert people's writing from popular sci-fi franchise"
arch=('x86_64')
url="https://github.com/theKapcioszek/fremen-transcriptor"
license=('GPL3')
depends=()
makedepends=('git' 'make')
optdepends=()
provides=('fremen-transcriptor')
conflicts=('fremen-transcriptor')
backup=()
install=
source=("git+$url")
sha256sums=('SKIP')

build() {
	cd "fremen-transcriptor"
	make
}

package() {
  cd "fremen-transcriptor"
  mkdir $pkgdir/opt
  mkdir $pkgdir/usr/
  mkdir $pkgdir/usr/bin
	make DESTDIR="$pkgdir/opt" SYMLINK="$pkgdir/usr/bin" install 
}
