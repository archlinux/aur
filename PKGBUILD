# Maintainer: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Bradley Kennedy <bk@co60.ca>

pkgname=libuiohook
pkgver=1.0.3
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
source=("https://github.com/kwhat/$pkgname/archive/${pkgver}.zip")
sha256sums=('a7bfdf7377223bf3c46b0028fa44e6070a009bfbd2e1111c506b777c8cf48e7d')

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
