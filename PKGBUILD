# Maintainer: OSO <osospeed@hotmail.com>
pkgname=ttyecho-git
pkgver=r2.beb3ecc
pkgrel=1
pkgdesc="Send commands or data to other terminals."
arch=('any')
url="https://github.com/osospeed/ttyecho.git"
makedepends=('git')
sha1sums=('SKIP')

source=("$pkgname"::"git+${url}")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="${pkgdir}/usr/bin/" install
}
