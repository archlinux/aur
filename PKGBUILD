# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=kilo-git
pkgver=r5.62b099a
pkgrel=1
pkgdesc="A text editor in less than 1000 LOC with syntax highlight and search (git version)"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/antirez/kilo"
license=('BSD')
makedepends=('git')
provides=('kilo')
conflicts=('kilo')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 kilo "$pkgdir/usr/bin/kilo"
}

# vim:set ts=2 sw=2 et:
