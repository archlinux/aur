# Maintainer: Wilsson Martee <wilssonm@gmail.com>

pkgname=lemonbar
pkgver=1.4
pkgrel=1
pkgdesc="A featherweight, lemon-scented, bar based on xcb."
arch=('i686' 'x86_64')
url="https://github.com/LemonBoy/bar"
license=('MIT')
depends=('libxcb')
makedepends=('pod2man')
provides=('lemonbar')
conflicts=('lemonbar')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7bfd36d7a4a950f61ed0d32c7d219678e7787a546d9ef4bc33f02393d60e4939')

build() {
  cd "bar-${pkgver}"
  make
}

package() {
  cd "bar-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
