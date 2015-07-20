# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=tint2-git
_pkgname=tint2
pkgrel=2
pkgver=v0.12.r23.g50e21b4
pkgdesc="Git official release"
arch=('i686' 'x86_64')
url="https://gitlab.com/o9000/tint2"
license=('GPL')
depends=('gtk2' 'imlib2' 'startup-notification')
makedepends=('cmake')
provides=('tint2')
conflicts=('tint2' 'tint' 'tint2-svn')
source="git+https://gitlab.com/o9000/tint2.git"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
 cd "$srcdir/$_pkgname"
 cmake . -DCMAKE_INSTALL_PREFIX=/usr 
 make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
