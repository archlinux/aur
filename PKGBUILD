# Maintainer: allonsy <linuxbash8@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=tilem
pkgver=2.0
pkgrel=1
pkgdesc="TI calculator emulator."
arch=(i686 x86_64)
url="http://lpg.ticalc.org/prj_tilem/index.html"
license=(GPL)
depends=('gtk2>=2.4' libticalcs)
makedepends=()
install='tilem.install'
source=(http://downloads.sourceforge.net/tilem/$pkgname-$pkgver.tar.bz2)
md5sums=('44c4c671bcdaf3d1e1c27c724a1e1857')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr LIBS="-lm"
  
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install prefix="$pkgdir/usr"
  find $pkgdir/usr/share/mime -maxdepth 1 -not -type d -exec rm {} \;
  rm $pkgdir/usr/share/applications/mimeinfo.cache
}

