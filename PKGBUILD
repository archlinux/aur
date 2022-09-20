# Maintainer: nafets227 <nafets227@users.noreply.github.com>
# Contributor: luelistan <archlinux-aur-git@max-weller.de>

pkgname=dhtest-git
pkgver=r70.c8f1dbb
pkgrel=1
pkgdesc="A DHCP client simulation on linux"
arch=("x86_64")
url="https://github.com/saravana815/dhtest"
license=('GPL2')
depends=("glibc")
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/saravana815/dhtest.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p $pkgdir/usr/bin
  install dhtest $pkgdir/usr/bin/dhtest
}

