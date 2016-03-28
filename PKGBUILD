# Maintainer: Tudor Roman <xenogenesis at openmailbox dot org>
pkgname=x11fs-git
pkgver=r70.9ea1117
pkgrel=1

pkgdesc='A tool for manipulating X windows'
url='https://github.com/sdhand/x11fs'
arch=('i686' 'x86_64')
license=('BSD-3')

depends=('libxcb' 'fuse')

provides=('x11fs')

source=('git://github.com/sdhand/x11fs')

md5sums=('SKIP')

pkgver() {
  cd x11fs
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd x11fs
  make
}

package() {
  cd x11fs
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
