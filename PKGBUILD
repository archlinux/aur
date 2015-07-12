# Maintainer: Robert Orzanna <orschiro@gmail.com>

pkgname=wat-git
pkgver=r3.8d130b6
pkgrel=1
pkgdesc="Show upgrades since recent -Syu"
arch=('i686' 'x86_64')
url="https://github.com/pbrisbin/wat"
license=('MIT')
depends=('pacman')
makedepends=('git')
source=("$pkgname"::'git://github.com/pbrisbin/wat.git')
#source=('git+https://github.com/orschiro/aclidswitch.git'
#source=('git+https://github.com/orschiro/aclidswitch.git#branch=master'
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/wat" "$pkgdir/usr/bin/wat"
}

