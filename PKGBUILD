# Contributor: Chris Salzberg <chris@dejimata.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=wat-git
pkgver=r29.0861966
pkgrel=1
pkgdesc="Show upgrades since recent -Syu"
arch=('i686' 'x86_64')
url="https://github.com/pbrisbin/wat"
license=('MIT')
depends=('pacman')
makedepends=('git')
source=("$pkgname::git+https://github.com/pbrisbin/wat.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/wat" "$pkgdir/usr/bin/wat"
}

