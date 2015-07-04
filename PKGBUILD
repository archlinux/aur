# Contributor: Dave Reisner <d@falconindy.com>

pkgname=expac-git
pkgver=3.9.g7a73405
pkgrel=1
pkgdesc="pacman database extraction utility"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/expac"
license=('MIT')
depends=('pacman')
makedepends=('git' 'perl')
conflicts=('expac')
provides=('expac')
source=('git://github.com/falconindy/expac.git')
md5sums=('SKIP')

pkgver() {
  cd expac

  git describe | sed 's/-/./g'
}

build() {
  cd expac

  make
}

package() {
  cd expac

  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
