# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=nxcore-git
_pkgname=nxcore
pkgver=0.99
pkgrel=1
pkgdesc="Base libraries for NX"
url="https://git.weitnahbei.de/nullmark/little_blue_man"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
makedepends=('git')
provides=('nxcore')
conflicts=('nxcore')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/nxcore")
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
