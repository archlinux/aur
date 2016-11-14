# Maintainer: Michael Straube <michael_straube web de>

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
sha1sums=('320fc075b2cebe8fbcdeb339919b6888e6e288fa')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
