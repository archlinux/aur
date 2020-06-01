# Maintainer: Roberto Polverelli Monti <rpolverelli at gmail>
pkgname=tintin-git
_gitname=tintin
pkgver=r22.df64b5a
pkgrel=1
pkgdesc="A console-based MUD client."
arch=('any')
url="https://github.com/scandum/tintin"
license=('GPL3')
conflicts=('tintin')
provides=('tintin')
makedepends=('pcre' 'gnutls' 'zlib')
source=('git://github.com/scandum/tintin.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname/src"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_gitname/src"
  make DESTDIR="$pkgdir/" install
}
