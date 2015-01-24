# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=vimb
pkgver=2.9
pkgrel=2
pkgdesc="The vim like browser"
arch=('i686' 'x86_64')
url="http://fanglingsu.github.io/vimb"
license=('GPL3')
depends=('libsoup' 'webkitgtk')
makedepends=('hardening-wrapper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fanglingsu/vimb/archive/$pkgver.tar.gz")
sha256sums=('179024e07c133b049d9fb7c487bed9b9a8512b633e1d857e038b26a01d2e3541')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make GTK=3
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
