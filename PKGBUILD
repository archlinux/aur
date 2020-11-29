pkgname=multiselect
pkgver=1.1.0
pkgrel=1
pkgdesc="multiple x11 selection server"
arch=('x86_64')
url="https://github.com/sgerwk/multiselect"
depends=('libx11' 'libxau' 'libxcb' 'libxdmcp')
source=(git+https://github.com/sgerwk/multiselect#tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd $startdir/src/$pkgname
  make || return 1
}

check() {
  cd $startdir/src/$pkgname
  return $(test -x multiselect)
}

package() {
  cd $startdir/src/$pkgname
  make DESTDIR=$startdir/pkg/$pkgname install
}

