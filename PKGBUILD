# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=nxbgs-git
_pkgname=nxbgs
pkgver=0.99
pkgrel=1
pkgdesc="Session daemon for NX"
url="https://git.weitnahbei.de/nullmark/nxbgs"
arch=('i686' 'x86_64')
license=('MIT')
depends=('nxlib')
optdepends=('nxinit: Session initialiastion')
makedepends=('git')
provides=('nxbgs')
conflicts=('nxbgs')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/nxbgs")
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
