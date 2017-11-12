# Maintainer: David Adler <d dot adler aet posteo dot de>

_pkgname=gnucap-random
pkgname=$_pkgname-git
pkgver=r12.96cdedf
pkgrel=1
pkgdesc="GSL based random variable sampling for Gnucap"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('gnucap' 'gsl')
makedepends=('git')
provides=('gnucap-random')
conflicts=('gnucap-random')
source=("$_pkgname::git+git://github.com/gnucap/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make
}

check() {
  cd $_pkgname
  make check
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
