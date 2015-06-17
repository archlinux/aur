#Maintainer: M0Rf30

pkgname=eselect-git
pkgver=751.f035e07
pkgrel=1
pkgdesc="Gentoo's multi-purpose configuration and management tool"
url="http://www.gentoo.org/proj/en/eselect/"
arch=('i686' 'x86_64')
license=('GPL')
source=('eselect::git://git.overlays.gentoo.org/proj/eselect.git')
makedepends=('git')

build() {
  cd eselect
  ./autogen.bash
  ./configure --prefix=/usr
  make 
} 

package() {
 cd eselect
 make DESTDIR=$pkgdir install
}

pkgver() {
  cd eselect
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
