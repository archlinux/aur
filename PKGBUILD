# Maintainer: Michael Straube <m.s.online gmx.de>
pkgname=x-corners
pkgver=0.1.1
pkgrel=1
pkgdesc='A commandline tool to set up hot corners under X11'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/mis2/x-corners'
depends=('libxi')
makedepends=('libxfixes')
source=("https://github.com/mis2/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('7de9911df41f05e2c33303809b72f5871976b458')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
