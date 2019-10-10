# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=igetnonce-git
pkgver=1
pkgrel=1
pkgdesc="igetnonce"
arch=('x86_64')
url="https://github.com/tihmstar/igetnonce"
makedepends=('libimobiledevice' 'libirecovery-git')
license=('unknown')
source=("git+https://github.com/tihmstar/igetnonce.git")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/igetnonce"
  ./autogen.sh
  make
}

package() {
  cd "${srcdir}/igetnonce"
  make prefix="/usr" DESTDIR="${pkgdir}" install
}
