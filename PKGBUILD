# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmpager
pkgver=1.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="simple desktop pager dockapp"
url="http://www.dockapps.net/${pkgname}"
license=("GPL")
depends=('libxpm')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('402f6678bc29d5c355e9bc79a28faf59')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 src/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 man/man1/$pkgname.1x "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm0644 src/buttons.xpm "$pkgdir/usr/share/wmpager/blue.xpm"
  install -m0644 themes/*.xpm "$pkgdir/usr/share/wmpager"
}

