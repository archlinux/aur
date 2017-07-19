# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=x-corners
pkgver=1.1
pkgrel=1
pkgdesc='A command line tool to set up hot corners under X11'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/mstraube/x-corners'
depends=('libxi')
makedepends=('libxfixes')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mstraube/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('fcea4126f2b33aa9b715d9a4d18906cdf82a467593a5a15e42af91cb40e1b2bc')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
