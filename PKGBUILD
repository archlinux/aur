# Author: Werner Almesberger (aka wpwrak)
# Maintainer: Dmitry Nasedkin <norgond@yahoo.co.jp>

pkgname=eeshow-git
_pkgname=eeshow
pkgver=71c9248
pkgrel=1
pkgdesc="An application for viewing git-managed eeschemas"
arch=('x86_64')
url='https://neo900.org/stuff/eeshow/'
license=('GPL2')
depends=(imagemagick cairo gtk3 libgit2 fig2dev)
provides=('eeshow')
conflicts=('eeshow')
source=('git+http://neo900.org/git/eeshow')
sha1sums=('SKIP')

pkgver() {
   cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Github-like shortened hash
}


build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
