#  Maintainer: maz-1 <ohmygod19993 at gmail dot com>

_pkgname=libsoxrate
pkgname=$_pkgname-git
pkgver=36.f447ead
pkgrel=1
pkgdesc="Library made from sox rate converter"
arch=('i686' 'x86_64')
license=('LGPL')
depends=()
makedepends=('git')
provides=('libsoxrate')
conflicts=('libsoxrate')
url="https://github.com/nu774/libsoxrate"
source=("$_pkgname::git+https://github.com/nu774/libsoxrate.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd $_pkgname
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install
}

