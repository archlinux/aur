# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=mkcl-git
pkgver=v1.1.9.r515.g19222c1
pkgrel=1
pkgdesc="ManKai Common Lisp"
arch=('x86_64')
url="https://github.com/jcbeaudoin/MKCL"
license=('LGPL')
options+=(!strip)
depends=('awk' 'bash' 'glibc' 'gmp')
makedepends=('git')
provides=('common-lisp')
source=('git+https://github.com/jcbeaudoin/MKCL.git')
sha512sums=('SKIP')

pkgver() {
  cd MKCL
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd MKCL
  ./configure --prefix=/usr
  make
}

package() {
  cd MKCL
  make DESTDIR=$pkgdir install
}

