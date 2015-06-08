# Maintainer: Pierre-Olivier Vauboin <povauboin at gmail dot com>
pkgname=pycdc-git
pkgver=180.32a14d5
pkgrel=1
pkgdesc="C++ python bytecode disassembler and decompiler"
arch=('x86_64' 'i686')
url="https://github.com/zrax/pycdc"
license=('GPL3')
makedepends=('git' 'cmake')
source=('git+https://github.com/zrax/pycdc.git')
sha1sums=('SKIP')
options=(!buildflags)
_gitname="pycdc"

pkgver() {
  cd "$srcdir/$_gitname"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  cmake .
  make
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 pycdc pycdas ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
