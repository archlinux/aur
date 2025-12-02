# Maintainer: claybie <claybie at claybie dot org>

pkgname='pak'
pkgver='1.1'
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
sha256sums=('3827ea5609d9e58565ce7bcf27ea67f71ce31435d5cac6b2d3dd3a434ddf60e7')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # doc
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
