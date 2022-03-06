# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=sprinkles-git
_pkgname=sprinkles
pkgver=6.1.99
pkgrel=1
pkgdesc="Dynamic Windowmanager forked from DWM with lots of sprinkles on top!"
url="https://git.weitnahbei.de/nullmark/sprinkles"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'libxinerama' 'libxft' 'freetype2')
optdepends=()
makedepends=('git')
provides=('sprinkles')
conflicts=('sprinkles')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/sprinkles")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
}
