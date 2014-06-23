# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=ledmon
pkgver=r6.d4b6a09
pkgrel=1
pkgdesc="Monitor your keyboard LED [C] (unmaintained)"
arch=('i686' 'x86_64')
url="http://github.com/jgoerzen/ledmon"
license=('GPL')
depends=('libx11')
makedepends=('git')

source=('ledmon::git+https://github.com/jgoerzen/ledmon.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/ledmon
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/ledmon
  make
}

package() {
  cd "$srcdir"/ledmon
  install -d "$pkgdir/usr/bin/"
  cp ledmon "$pkgdir/usr/bin/"
} 
