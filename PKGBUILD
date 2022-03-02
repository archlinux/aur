# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=nxlib-git
_pkgname=nxlib
pkgver=0.99
pkgrel=1
pkgdesc="Base libraries for NX"
url="https://git.weitnahbei.de/nullmark/little_blue_man"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
makedepends=('git')
provides=('nxlib')
conflicts=('nxlib')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/nxlib")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
