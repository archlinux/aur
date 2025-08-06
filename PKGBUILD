# Maintainer: Wilsson Martee <wilssonm@gmail.com>

pkgname=lemonbar
pkgver=1.5
pkgrel=2
pkgdesc="A featherweight, lemon-scented, bar based on xcb."
arch=('i686' 'x86_64')
url="https://github.com/LemonBoy/bar"
license=('MIT')
depends=('libxcb')
makedepends=('pod2man')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bc8defe0ce6e4c1b16fd6ba3080a08e4502d6cf9d09440186044eae6b2d7460d')

build() {
  cd "bar-${pkgver}"
  make
}

package() {
  cd "bar-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
