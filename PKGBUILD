# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=nxrandrd-git
_pkgname=nxrandrd
pkgver=0.99
pkgrel=1
pkgdesc="Randr daemon for NX"
url="https://git.weitnahbei.de/nullmark/nxrandrd"
arch=('i686' 'x86_64')
license=('MIT')
depends=('nxlib')
optdepends=('nxinit: Session initialiastion')
makedepends=('git')
provides=('nxrandrd')
conflicts=('nxrandrd')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/nxrandrd")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
}
