# Maintainer: shaaanuu <monshan50 at gmail dot com>
pkgname=swaycut
pkgver=r17.09d2bdd
pkgrel=1
pkgdesc="Minimal screenshot utility for Sway"
arch=('any')
url="https://github.com/shaaanuu/swaycut"
license=('MIT')
depends=('grim' 'slurp' 'jq' 'wl-clipboard' 'imagemagick' 'libnotify')
makedepends=('git')
provides=('swaycut')
conflicts=('swaycut')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm755 swaycut "$pkgdir/usr/bin/swaycut"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
