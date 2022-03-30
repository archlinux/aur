# Maintainer: Latif Sulistyo <latifsulistyo.me@gmail.com>

# shellcheck disable=2034,2154
# shellcheck shell=bash

_pkgname=rubato
pkgname=awesome-$_pkgname-git
pkgver=r62.51b4f76
pkgrel=1
pkgdesc='Create smooth animations with a slope curve for awesomeWM'

arch=('any')
url='https://github.com/andOrlando/rubato'
license=('MIT')
depends=('awesome')
makedepends=('git')
source=('git+https://github.com/andOrlando/rubato.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname" || exit 1

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  find . \
    -type f \
    \( -iname '*.lua' \) \
    -exec install -Dm644 {} "$pkgdir/usr/share/awesome/lib/$_pkgname/{}" \;
}
