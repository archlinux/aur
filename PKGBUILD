# Maintainer: eatsu <mkrmdk@gmail.com>

pkgname='pac-wrapper'
pkgver='2.0.0'
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('489d5a5f6e999125ad8ed52c5cc7caec381bb9ce0f29849410204cdd8eacb710')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # doc
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
