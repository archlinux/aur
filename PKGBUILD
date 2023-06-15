# Maintainer:  Nicholas Wang <me#nicho1as.wang>

pkgname=libjsonbuilder-git
pkgver=20230615
conflicts=('libjsonbuilder')
provides=('libjsonbuilder')
pkgrel=1
pkgdesc="Simple JSON construction library in C."
arch=('x86_64')
source=('libjsonbuilder::git+https://github.com/nicholascw/libjsonbuilder#branch=master')
license=('GPL3')
sha1sums=('SKIP')
makedepends=('git')
depends=('glibc')
url='https://github.com/nicholascw/libjsonbuilder'

pkgver() {
  cd ${srcdir}/libjsonbuilder
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd ${srcdir}/libjsonbuilder
  make
}

package() {
  install -Dm755 ${srcdir}/libjsonbuilder/libjsonbuilder.so "${pkgdir}"/usr/lib/libjsonbuilder.so
  install -Dm644 ${srcdir}/libjsonbuilder/jsonbuilder.h "${pkgdir}"/usr/include/jsonbuilder.h
}
