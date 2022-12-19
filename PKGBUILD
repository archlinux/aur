# Maintainer: eatsu <mkrmdk@gmail.com>

pkgname='pac-wrapper'
pkgver='4.0.0'
pkgrel='1'
pkgdesc='A pacman wrapper that provides intuitive syntax similar to dnf, apt, zypper, etc.'
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
sha256sums=('b23e52ce9ed5c90611611d0336183be190395fff4a639ffc089bd72aeb3b95dd')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # doc
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
