# Maintainer: philomath <philomath868 AT gmail DOT com>
# Maintainer: Pavel Borzenkov <pavel@voidptr.ru>

pkgname=pahole
pkgver=1.11
pkgrel=1
pkgdesc="Various DWARF utils"
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=devel/pahole/pahole.git;a=summary"
license=('GPL2')
depends=('elfutils' 'python')
makedepends=('git' 'cmake')
replaces=('dwarves')
source=("https://git.kernel.org/pub/scm/devel/${pkgname}/${pkgname}.git/snapshot/${pkgname}-${pkgver}.tar.gz")
changelog=${pkgname}.changelog
md5sums=("33d2603497a599188b9d26ec3e416a98")
sha1sums=("d1e0aace518342203c713b87024ebada848acd64")

build()
{
  cd "${pkgname}-${pkgver}"

  cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr -D__LIB=lib . || return 1
  make || return 1
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir}/ install
}

# vim:set ts=2 sw=2 et:
