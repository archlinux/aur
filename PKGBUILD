# Maintainer: Hyacinthe Cartiaux
pkgname=qconf-git
pkgver=r3.28751dd
pkgrel=1
pkgdesc="Qt5 compatible qconf - Qt configuration tool"
arch=('i686' 'x86_64')
url="https://github.com/psi-plus/qconf"
license=('GPL2')
depends=('qt5-base')
makedepends=('git')
conflicts=(qconf)
provides=(qconf)
source=(git+https://github.com/psi-plus/qconf.git)
md5sums=('SKIP')

pkgver() {
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/qconf

  ./configure --prefix=/usr
  make

}

package() {
  cd $srcdir/qconf
  make INSTALL_ROOT="$pkgdir" install
}

