# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=txt2pdbdoc-git
_pkgname=txt2pdbdoc
pkgver=r67.9c7c20e
pkgrel=1
pkgdesc="Text to PalmOS Doc file conversion program"
arch=('i686' 'x86_64')
url="https://github.com/paul-j-lucas/txt2pdbdoc"
license=('GPL-2.0')
depends=('perl')
source=("git+https://github.com/paul-j-lucas/txt2pdbdoc")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  }

build() {
  cd $srcdir/$_pkgname
  autoreconf -fiv
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR=$pkgdir install
}
