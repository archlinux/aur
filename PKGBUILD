pkgname=fetchdots
pkgver=1.0
pkgrel=1
pkgdesc="Fetch and manage dotfiles using FetchDots"
arch=('x86_64')
url="https://fetchdots.net"
license=('GNU')

depends=('ncurses')
makedepends=('gcc' 'make')

source=("https://github.com/jaysalw/fetchdotfiles/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd fetchdotfiles-$pkgver
  make
}

package() {
  cd fetchdotfiles-$pkgver
  install -Dm755 fdf "$pkgdir/usr/bin/fdf"
}
