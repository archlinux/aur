# Maintainer: eatsu <mkrmdk@gmail.com>

pkgname='pac-wrapper'
pkgver='1.0.0'
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
sha256sums=('5d73c0981a36ad9bcb5040ff2395e44cb285bc76e6648824dca3ed4902bf0187')

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" pac

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # doc
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
