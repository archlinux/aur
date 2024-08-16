# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=9cc-git
pkgver=r267.ea2f4b8
pkgrel=1
pkgdesc='Simple and clean C11 compiler'
arch=(i686 x86_64)
url='https://github.com/rui314/9cc'
license=(MIT)
depends=(glibc)
makedepends=(git)
source=(git+http://github.com/rui314/9cc)
sha1sums=('SKIP')

pkgver() {
  cd 9cc
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd 9cc
}

build() {
  cd 9cc
  make
}

check() {
  cd 9cc
  make test
}

package() {
  cd 9cc

  install -Dm755 9cc "$pkgdir/usr/bin/9cc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

