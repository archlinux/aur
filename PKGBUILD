# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=cower-git
pkgver=17
pkgrel=1
pkgdesc="A simple AUR agent with a pretentious name"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/cower"
license=('MIT')
depends=('curl' 'pacman' 'yajl' )
makedepends=('git' 'perl')
conflicts=('cower')
provides=('cower')
source=("git://github.com/falconindy/cower")
md5sums=('SKIP')

pkgver() {
  cd 'cower'
  git describe | sed 's/-/./g'
}

build() {
  make -C cower
}

package() {
  make -C cower PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
