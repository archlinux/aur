# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=sharness
pkgver=1.2.1
pkgrel=1
pkgdesc='Shell library to test your tools like Git does'
url="https://github.com/felipec/$pkgname"
arch=(any)
license=(GPL2)
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('94d6f94f2199745e0e1a50e5bb3cc12edcac2177e1d410278652ba7a0a3a90ec')

check() {
  cd "$pkgname-$pkgver" || exit 1
  make test
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  DESTDIR="$pkgdir" make prefix=/usr VIM_DIR=/usr/share/vim/vimfiles install install-vim
}
