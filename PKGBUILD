# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=reed
pkgver=5.4
pkgrel=1
pkgdesc="A text pager to display etexts, with bookmarks, autoscrolling and more"
arch=('i686' 'x86_64')
url="http://web.archive.org/web/20040217010815/www.sacredchao.net/software/reed/"
license=('GPL')
depends=('ncurses')
source=("http://distcache.freebsd.org/ports-distfiles/$pkgname-$pkgver.tar.gz")
md5sums=('22c8d80dd6a81ecc6ef60662f2d1840c')

build() {
  cd "$pkgname-$pkgver"
  ./configures --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
