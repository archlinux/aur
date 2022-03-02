# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=nxinit-git
_pkgname=nxinit
pkgver=0.99
pkgrel=1
pkgdesc="Session initialiastion for NX"
url="https://git.weitnahbei.de/nullmark/nxinit"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
optdepends=('nxhelper: NX integration')
makedepends=('git')
provides=('nxinit')
conflicts=('nxinit')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/nxinit")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README.md"
}
