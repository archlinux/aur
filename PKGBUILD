# Maintainer: Felix Salfelder

_pkgname=gnucap-jack
pkgname=$_pkgname-git
pkgver=r11.a1ba7a1
pkgrel=1
pkgdesc="jack audio devices and simulation for Gnucap"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('gnucap' 'boost' 'jack')
makedepends=('git')
provides=('gnucap-jack')
conflicts=('gnucap-jack')
source=("$_pkgname::git+git://codeberg.org/gnucap/$_pkgname.git#branch=develop")
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
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
