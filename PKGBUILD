# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=autopano-sift-c-hg
pkgver=124.1442bb7179d3
pkgrel=1
pkgdesc="Identify key feature points within arbitrary images"
arch=('i686' 'x86_64')
url="http://hugin.sourceforge.net/"
license=('GPL2')
depends=('libxml2' 'libpano13')
makedepends=('subversion' 'cmake' 'mercurial')
provides=('autopano-sift-c')
conflicts=('autopano-sift' 'autopano-sift-c')
source=("hg+http://hugin.hg.sourceforge.net:8000/hgroot/hugin/autopano-sift-C")
md5sums=('SKIP')

pkgver() {
  cd autopano-sift-C
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/autopano-sift-C"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/autopano-sift-C"
  make DESTDIR="$pkgdir" install
}
