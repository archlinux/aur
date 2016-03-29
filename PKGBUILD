# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=lxi-tools-git
pkgver=r7.03bf830
pkgrel=1
pkgdesc="LXI Tools is a collection of software tools for controlling LXI instruments"
arch=('i686' 'x86_64')
url="https://github.com/lxi/liblxi"
license=('BSD-3')
provides=('lxi-tools')
conflicts=('lxi-tools')
depends=('liblxi-git')
source=("$pkgname::git+https://github.com/lxi/lxi-tools")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  ./autogen.sh
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

