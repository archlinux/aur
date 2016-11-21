
# Maintainer: Liam Greenough <beacon515@gmail.com>

pkgname=salientia-git
pkgver=_
pkgrel=1
pkgdesc="Recursive dependency-traversing batch-engraver for GNU Lilypond"
arch=('i686' 'x86_64')
url="https://github.com/Beacon515L/salientia"
license=('GPL')
depends=('lilypond')
makedepends=('cmake')
provides=('salientia')
conflicts=('salientia')
source=('git+https://github.com/Beacon515L/salientia.git')
md5sums=('SKIP')

build() {
  cd salientia
  cmake .
  make
  }

package(){
  mkdir $pkgdir/usr $pkgdir/usr/bin
  cp $srcdir/salientia/salientia $pkgdir/usr/bin/
  chmod 755 $pkgdir/usr/bin/salientia
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
