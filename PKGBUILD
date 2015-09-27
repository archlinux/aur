# $Id$
# See AUR interface for current maintainer

pkgname=libuiohook
pkgver=1.0
pkgrel=1
pkgdesc="A multi-platform C library to provide global input/ouput hooking from userland."
arch=('i686' 'x86_64')
url="https://github.com/kwhat/libuiohook"
license=('GPL3')
groups=()
depends=()
makedepends=() # All included in base-devel
optdepends=()
conflicts=()
source=("https://github.com/kwhat/$pkgname/archive/1.0.zip")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./bootstrap.sh
  ./configure --prefix=/usr --libexecdir=/usr/lib --without-libsigsegv
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
