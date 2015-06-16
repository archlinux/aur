# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Robin Martinjak <rob@rmartinjak.de>

_gitname=correcthorse
pkgname=correcthorse-git
pkgver=1.0.r23.g2a214af
pkgrel=1
pkgdesc="Passphrase generator based on https://xkcd.com/936/"
arch=('i686' 'x86_64')
url="https://github.com/rmartinjak/correcthorse"
license=('WTFPL')
makedepends=('git')
provides=('correcthorse')
conflicts=('correcthorse')
source=(git://github.com/rmartinjak/correcthorse.git)
md5sums=('SKIP')


pkgver() {
  cd "$_gitname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
  cd "$_gitname"

  make PREFIX=/usr
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
