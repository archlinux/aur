# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=img4tool-git
pkgver=r162.d514ce5
pkgrel=1
pkgdesc="Tool for manipulating IMG4, IM4M and IM4P files"
arch=('x86_64')
url="https://github.com/tihmstar/img4tool"
license=('LGPL3')
depends=('libgeneral' 'libplist' 'openssl')
makedepends=('git' 'lzfse')
provides=('img4tool')
conflicts=('img4tool')
source=("git+https://github.com/tihmstar/img4tool.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/img4tool"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/img4tool"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/img4tool"
  make DESTDIR="${pkgdir}" install
}
