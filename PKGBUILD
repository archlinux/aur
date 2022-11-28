# Maintainer: eatsu <mkrmdk@gmail.com>

pkgname='pac-wrapper'
pkgver='3.0.0'
pkgrel='1'
pkgdesc='A simple pacman wrapper that provides intuitive syntax similar to dnf, apt, zypper, etc.'
arch=('any')
url='https://github.com/eatsu/pac-wrapper'
license=('MIT')
depends=(
  'bash'
  'pacman'
  'sudo'
)
provides=('pac')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f85d09754c9463e2963fe83265ffdd1e4eba42e32e6924719e60f38ead90b68f')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # doc
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
