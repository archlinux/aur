# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=lbm-git
_pkgname=lbm
pkgver=0.99
pkgrel=1
pkgdesc="A simple bluetooth helper for X"
url="https://git.weitnahbei.de/nullmark/little_blue_man"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'libxft' 'libxinerama' 'dbus')
makedepends=('git')
provides=('lbm')
conflicts=('lbm')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/little_blue_man")
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
