# Maintainer: claybie <claybie at claybie dot org>

pkgname='pak'
pkgver='1.0.1'
pkgrel='1'
pkgdesc='A fork of pac-wrapper with commands styled toward apk (alpine package keeper).'
arch=('any')
url='https://github.com/claybie/pak'
license=('MIT')
depends=(
  'pacman'
  'util-linux'
)
optdepends=(
  'bash'
  'zsh'
  'fish'
  'sudo'
  'opendoas'
)
provides=('pak')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7f24bdf4b75ec6246a5e2df76bbb1133db2f69bce1cdf1336bae4bc8b0d1edab')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # doc
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
