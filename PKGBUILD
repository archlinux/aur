# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=x-corners
pkgver=0.2.0
pkgrel=1
pkgdesc='A commandline tool to set up hot corners under X11'
arch=('i686' 'x86_64')
license=('ISC')
url='https://github.com/mstraube/x-corners'
depends=('libxi')
makedepends=('libxfixes')
source=("https://github.com/mstraube/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a2c2e8f7a6ca71bd8ed36a8c7a9e3505137fb60ff211e2fc567c4d52ba9ce0fc')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
