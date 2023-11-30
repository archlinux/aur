# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=nxsystaemon-git
_pkgname=nxsysdaemon
pkgver=0.99
pkgrel=1
pkgdesc="System daemon for NX"
url="https://git.weitnahbei.de/nullmark/nxsysdaemon"
arch=('i686' 'x86_64')
license=('MIT')
depends=('nxlib' 'nxhelper')
optdepends=()
makedepends=('git')
provides=('nxsysdaemon')
conflicts=('nxsysdaemon')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/nxsysdaemon")
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
