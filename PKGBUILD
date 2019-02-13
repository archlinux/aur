# Maintainer: Andreas Bolka <a AT bolka DOT at>

pkgname=z.lua-git
pkgver=1.4.4.gcf45449
pkgrel=1
pkgdesc='A command line tool which helps you navigate faster by learning your habits'
arch=('any')
url='https://github.com/skywind3000/z.lua'
license=('MIT')
depends=('lua')
makedepends=('git')
provides=('z.lua')
conflicts=('z.lua')
source=("$pkgname::git+https://github.com/skywind3000/z.lua")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local GITID=$(git rev-parse --short HEAD)
  echo "${pkgver%\.g*}.g$GITID"
}

package() {
  cd "$srcdir/$pkgname"
  install -D -t "$pkgdir/usr/share/z.lua/" z.lua
  install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname%-*}/" LICENSE
}
