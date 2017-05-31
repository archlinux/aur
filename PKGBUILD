# Maintainer: Charles Heywood <vandor2012@gmail.com>
pkgname=('lua-cqueues-git' 'lua51-cqueues-git' 'lua52-cqueues-git')
pkgver=20161215.r1.97cac6d
pkgrel=1
arch=('i686' 'x86_64')
url="http://25thandclement.com/~william/projects/cqueues.html"
license=('MIT')
makedepends=('git' 'openssl')
source=('git+https://github.com/wahern/cqueues.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/cqueues"
  git describe --tags --long | sed "s/^[^-]*-//;s/\([^-]*-\)g/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/cqueues"
  make prefix=/usr
}

package_lua-cqueues-git() {
  pkgdesc="Asynchronous networking, threading, and notification framework for Lua 5.3"

  cd cqueues
  make DESTDIR="$pkgdir" prefix=/usr install5.3
  install -Dm644 LICENSE "$pkgdir"/usr/share/license/$pkgname/LICENSE
}

package_lua51-cqueues-git() {
  pkgdesc="Asynchronous networking, threading, and notification framework for Lua 5.1"

  cd cqueues
  make DESTDIR="$pkgdir" prefix=/usr install5.1
  install -Dm644 LICENSE "$pkgdir"/usr/share/license/$pkgname/LICENSE
}

package_lua52-cqueues-git() {
  pkgdesc="Asynchronous networking, threading, and notification framework for Lua 5.2"

  cd cqueues
  make DESTDIR="$pkgdir" prefix=/usr install5.2
  install -Dm644 LICENSE "$pkgdir"/usr/share/license/$pkgname/LICENSE
}
# vim:set et sts=0 sw=2 ts=2:
