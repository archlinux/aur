# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
_pkg=cado-nfs
pkgname=${_pkg}-git
pkgver=20151205.bb92b56
pkgrel=1
pkgdesc="Implementation of the Number Field Sieve (NFS) algorithm for factoring integers"
arch=('i686' 'x86_64')
url="http://cado-nfs.gforge.inria.fr/"
license=('LGPL2')
depends=('gmp' 'python' 'sqlite')
makedepends=('git' 'cmake' 'inetutils')
conflicts=('cado-nfs')
provides=('cado-nfs')
source=("git://scm.gforge.inria.fr/cado-nfs/${_pkg}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkg"
  git log -1 --format="%cd.%h" --date=short | sed 's/-//g'
}

build() {
  cd "$_pkg"
  make PREFIX="/usr"
}

package() {
  cd "$_pkg"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
