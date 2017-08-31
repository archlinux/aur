# Maintainer: Mildred Ki'Lya <mildred-in.aur@mildred.fr>
pkgname=darkradiant-git
pkgrel=1
pkgdesc="Editor for The Dark Mod and Doom 3 (idTech4) based games"
makedepends=(automake libtool)
depends=(wxgtk ftgl glew boost boost-libs freealut webkitgtk2 pybind11)
conflicts=(darkradiant)
provides=(darkradiant)
arch=(x86_64)
url=http://www.darkradiant.net
license=(GPL LGPL BSD)
pkgver=2.1.0.r559.gb2f5471ea
source=("DarkRadiant::git+https://github.com/codereader/DarkRadiant.git")
sha512sums=(SKIP)

pkgver(){
  cd "$srcdir/DarkRadiant"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$srcdir/DarkRadiant"
  ./autogen.sh
  ./configure
}

build(){
  cd "$srcdir/DarkRadiant"
  make
}

package(){
  cd "$srcdir/DarkRadiant"
  make DESTDIR="$pkgdir" install
}
