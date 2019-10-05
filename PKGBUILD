# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=img4tool-git
pkgver=1
pkgrel=1
pkgdesc="Tool for manipulating IMG4, IM4M and IM4P files"
arch=('x86_64')
url="https://github.com/tihmstar/img4tool"
license=('LGPL3')
makedepends=('lzfse')
source=("git+https://github.com/tihmstar/img4tool.git")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/img4tool"
  ./autogen.sh
  make
}

package() {
  cd "${srcdir}/img4tool"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
