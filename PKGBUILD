# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=sharness
pkgver=1.2.0
pkgrel=1
pkgdesc='Shell library to test your tools like Git does'
url="https://github.com/felipec/$pkgname"
arch=(any)
license=(GPL2)
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('69e7fc275e61c2fcfb20d86611ea747bae66b0b4f23967898ea768b58caed4f3')

check() {
  cd "$pkgname-$pkgver" || exit 1
  make test
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  DESTDIR="$pkgdir" make prefix=/usr install
}
