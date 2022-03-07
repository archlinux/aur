# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=statinator4k-git
_pkgname=statinator4k
pkgver=20.0.99
pkgrel=1
pkgdesc="Prints out system status information for things like the dwm (or sprinkles) bar"
url="https://git.weitnahbei.de/nullmark/statinator4k"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'libxinerama' 'libxft' 'freetype2')
optdepends=('dbus: notifications', 'alsa-lib: Alsa volume display')
makedepends=('git')
provides=('statinator4k')
conflicts=('statinator4k')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/statinator4k")
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
