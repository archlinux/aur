pkgname=catwm-git
_pkgname=catwm
pkgver=r75.c1f52fd
pkgrel=1
epoch=1
pkgdesc="Cute And Tiny Window Manager"
url="http://github.com/pyknite/catwm"
license=('GPL')
depends=('libxinerama')
makedepends=('git')
arch=(i686 x86_64)
provides=($_pkgname)
conflicts=($_pkgname)
options=(!libtool)
source=("$pkgname::git+https://github.com/mytch444/catwm.git")
md5sums=('SKIP')
 
pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd $pkgname
  make PREFIX=/usr 
}

package() {
  cd $pkgname
  make PREFIX=/usr BINDIR="${pkgdir}/usr/bin" install
}
