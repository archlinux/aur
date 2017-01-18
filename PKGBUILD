# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=grumpy
pkgver=r149.35d1202
pkgrel=1
pkgdesc='Grumpy is a Python to Go source code transcompiler and runtime'
arch=('x86_64' 'i686')
url='https://github.com/google/grumpy'
depends=('go' 'python2')
makedepends=('go' 'python2' 'git')
license=('Apache')
options=('!strip')
source=("git+https://github.com/google/grumpy.git#commit=35d1202"
        'makefile.patch')
md5sums=('SKIP'
         '1a73c49f15cd1ab978e5cacd0ea84ecb')

prepare() {
  cd grumpy
  patch -p1 -i ../makefile.patch
}

build() {
  PYTHON=python2 make -C grumpy -j2
}

package() {
  PYTHON=python2 DESTDIR="$pkgdir" make -C grumpy install
}

# vim:set ts=2 sw=2 et:
