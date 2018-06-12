# Maintainer: David Adler <d dot adler aet posteo dot de>
# Maintainer: Felix Salfelder <felix aet salfelder dott org>

_pkgname=gnucap
pkgname=$_pkgname-git
pkgver=20171002.develop
pkgrel=1
pkgdesc="GNU Circuit Analysis Package (develop branch)"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=()
makedepends=('git')
provides=('gnucap')
conflicts=('gnucap')
source=("$_pkgname::git+git://git.sv.gnu.org/$_pkgname.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
