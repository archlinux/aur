# Maintainer: Brian BIdulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=pawm
pkgver=2.3.0
pkgrel=3
pkgdesc="Puto Amo Window Manager is a full featured window manager, but without useless bells and whistles"
arch=('x86_64' 'i686')
#url="http://www.pleyades.net/pawm/"
url="https://sites.google.com/site/pleyadestest/david/projects/pawm"
license=("GPL")
depends=('libxft' 'libxpm' 'libxrandr')
makedepends=('cmake')
source=(http://www.pleyades.net/pawm/files/pawm-$pkgver.tar.gz)
md5sums=('cc004865f5b5d8118e68154857b913a2')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  export LDFLAGS="-lXrender -lXext -lX11"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}
