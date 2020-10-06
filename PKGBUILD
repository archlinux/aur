# Maintainer: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Bradley Kennedy <bk@co60.ca>

pkgname=libuiohook
newname=uiohook
pkgver=1.0.3
pkgrel=4
pkgdesc="A multi-platform C library to provide global input/ouput hooking from userland."
arch=('i686' 'x86_64')
url="https://github.com/kwhat/libuiohook"
license=('GPL3')
groups=()
depends=("libxt" "libxtst" "libxinerama")
makedepends=() # All included in base-devel
optdepends=()
conflicts=()
source=("https://github.com/kwhat/$newname/archive/${pkgver}.zip")
sha256sums=('e972be653e303838354781209798ec0ad2ff1e416c62cf20db6f1cf2ba1ef604')

build() {
  cd "$srcdir/$newname-$pkgver"
  ./bootstrap.sh
  ./configure --prefix=/usr --libexecdir=/usr/lib --without-libsigsegv
  make
}

package() {
  cd "$srcdir/$newname-$pkgver"
  make DESTDIR="$pkgdir" install
}
