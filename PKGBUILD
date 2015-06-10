pkgname=catwm-git
pkgver=20140202
pkgrel=1
pkgdesc="Cute And Tiny Window Manager"
url="http://github.com/pyknite/catwm"
license=('GPL')
depends=('libx11')
makedepends=('git')
arch=(i686 x86_64)
options=(!libtool)
source='git+https://github.com/mytch444/catwm.git'
md5sums=('SKIP')
_gitname="catwm"
 
pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd $srcdir/$_gitname
  make PREFIX=/usr 
}

package() {
  cd $srcdir/$_gitname
  make BINDIR=${pkgdir}/usr/bin install
}
