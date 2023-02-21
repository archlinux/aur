# Maintainer: libele <libele@disroot.org>

_pkgname=ansiweather
pkgname=ansiweather-git
pkgver=1.19.0.r2.g8443fe3
pkgrel=1
pkgdesc="Weather in terminal, with ANSI colors and Unicode symbols (git version)"
arch=('any')
url="https://github.com/fcambus/ansiweather"
license=('BSD')
depends=('bc' 'curl' 'jq')
makedepends=('git')
optdepends=('wget: alternative fetch command')
provides=('ansiweather')
conflicts=('ansiweather')
source=("git+https://github.com/fcambus/ansiweather")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
