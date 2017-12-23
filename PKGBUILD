# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=x-corners
pkgver=1.2
pkgrel=1
pkgdesc='A command line tool to set up hot corners under X11'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/mstraube/x-corners'
depends=('libxi')
makedepends=('libxfixes')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mstraube/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('36941367bc093dc25e499e3087b373a90752719ab6fee90937f6f1c72c417bc8')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
