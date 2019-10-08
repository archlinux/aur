# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=img4tool-git
pkgver=1
pkgrel=2
pkgdesc="Tool for manipulating IMG4, IM4M and IM4P files"
arch=('x86_64')
url="https://github.com/tihmstar/img4tool"
license=('LGPL3')
makedepends=('lzfse' 'libplist')
source=("git+https://github.com/tihmstar/img4tool.git")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/img4tool"
  ./autogen.sh
  make
}

package() {
  cd "${srcdir}/img4tool"
  make prefix="/usr" DESTDIR="${pkgdir}" install
}
