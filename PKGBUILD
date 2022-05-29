# Maintainer:  <zhaose@Planet>
pkgname=purple-oicq-git
provides=('purple-oicq')
conflicts=('purple-oicq')
pkgver=v1.0.1.r0.g810034c
pkgrel=1
pkgdesc="oicq plugin for pidgin"
arch=('i686' 'x86_64')
url="https://github.com/axon-oicq/purple-oicq"
license=('NONE')
depends=('libpurple' 'json-c')
makedepends=('git')
source=("$pkgname::git+https://github.com/axon-oicq/purple-oicq.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
