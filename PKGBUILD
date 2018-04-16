pkgname=xdg-open-server
pkgver=1.2
pkgrel=1
pkgdesc='xdg-open portal for Docker containers'
arch=('i686' 'x86_64')
url="https://github.com/kitsunyan/$pkgname"
license=('MIT')
depends=('libx11' 'xdg-utils')
optdepends=('socat: xdg-open client script support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('52393de15b6852109bb3f77073baf8a5e8b117a9d38121cf798b5e6465472d52')

_make_flags=(PREFIX=/usr SYSCONFDIR=/etc)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make "${_make_flags[@]}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make "${_make_flags[@]}" DESTDIR="$pkgdir" install
}
