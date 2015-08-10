# Maintainer: Lars Hagström <lars@foldspace.nu>
pkgname=jsonrpc-c-git
pkgver=r42.e06e60b
pkgrel=1
pkgdesc="A library for a C program to receive or make JSON-RPC requests on tcp sockets (no HTTP)."
arch=('i686' 'x86_64')
url="https://github.com/airtame/jsonrpc-c"
license=('MIT')
groups=()
depends=()
makedepends=()
backup=()
provides=("jsonrpc-c")
options=()
install=
source=("$pkgname"::"git+https://github.com/airtame/jsonrpc-c.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$pkgname"

  autoreconf -vfi
  ./configure --prefix=/usr --includedir=/usr/include/jsonrpc-c
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}
