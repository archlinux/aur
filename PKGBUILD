# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=nxpolkit-git
_pkgname=nxpolkit
pkgver=0.99
pkgrel=1
pkgdesc="Polkit client for NX"
url="https://git.weitnahbei.de/nullmark/nxpolkit"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2' 'polkit')
optdepends=('nxinit: Session initialiastion')
makedepends=('git')
provides=('nxpolkit')
conflicts=('nxpolkit')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/nxpolkit#branch=devalafy")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README.md"
}
