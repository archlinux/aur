# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  Daichi Shinozaki <dsdseg@gmail.com>
pkgname=goaljobs
pkgver=0.2
pkgrel=3
pkgdesc="A flexible build system and business rules manager similar to make and cron, but much more powerful."
arch=('i686' 'x86_64')
url="http://rwmj.wordpress.com/tag/goaljobs/"
license=('GPL')
makedepends=('ocaml>=3.12.0' 'ocaml-findlib' 'ocaml-calendar' 'camlp4')
options=()
source=("http://people.redhat.com/~rjones/goaljobs/files/$pkgname-$pkgver.tar.gz")
md5sums=('70b74a9046e576f984e40b3729f5ca37')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver

  make -k check
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
