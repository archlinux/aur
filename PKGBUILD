# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=xdg-open-server
pkgver=1.3
pkgrel=1
pkgdesc='xdg-open portal for Docker containers'
arch=('i686' 'x86_64')
url="https://github.com/kitsunyan/$pkgname"
license=('MIT')
depends=('libx11' 'xdg-utils')
optdepends=('socat: xdg-open client script support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('df9255f5ef1f21fd90cce59e3357dbc747e76b22261e7b1db979c879a1377d80')

_make_flags=(PREFIX=/usr SYSCONFDIR=/etc)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make "${_make_flags[@]}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make "${_make_flags[@]}" DESTDIR="$pkgdir" install
}
