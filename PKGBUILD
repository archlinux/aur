# Maintainer: Pau Escrich <p4u@dabax.net>

pkgname=bmx6
pkgver=r8f26909
pkgrel=1
pkgdesc="bmx6 mesh routing network daemon"
arch=('i686' 'x86_64')
url="https://github.com/axn/bmx6"
license=('GPL2')
depends=('glibc')
makedepends=('git' 'make' 'gcc')
conflicts=('')
provides=('bmx6')

source=("$pkgname"::'git+https://github.com/axn/bmx6')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 bmx6 ${pkgdir}/usr/bin/bmx6
}
