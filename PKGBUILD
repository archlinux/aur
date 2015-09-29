# Maintainer: pablof <quuxbaz@gmail.com>

pkgname=zettair
pkgver=0.9.3
pkgrel=2
pkgdesc="A fast, compact search engine for HTML (or TREC) collections."
arch=('i686' 'x86_64')
url="http://web.archive.org/web/20150321034649/http://www.seg.rmit.edu.au/zettair/index.html"
license=('bsd')
depends=()
makedepends=('pkgconfig')
source=(http://web.archive.org/web/20150321034701/http://www.seg.rmit.edu.au/zettair/download/$pkgname-$pkgver.tar.bz2)
md5sums=('03b437d09e605be1eab2b6c42d45165d')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
