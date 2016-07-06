# Maintainer: Michael Straube <michael_straube web de>

pkgname=x-corners
pkgver=0.1.1
pkgrel=2
pkgdesc='A commandline tool to set up hot corners under X11'
arch=('i686' 'x86_64')
license=('ISC')
url='https://github.com/mstraube/x-corners'
depends=('libxi')
makedepends=('libxfixes')
source=("https://github.com/mstraube/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('b7c0a3c1f7daccaa4f16bebb0de426d606c0de66')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
