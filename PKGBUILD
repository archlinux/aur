# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=olm
pkgname=libolm-git
pkgver=0.1.0.r94.gf2151c0
pkgrel=1
pkgdesc='An implementation of a well known cryptographic ratchet in C++'
arch=('i686' 'x86_64' 'armv7h')
url="https://matrix.org/git/olm/"
license=('Apache')
depends=('gcc-libs')
makedepends=('git')
conflicts=('libolm')
provides=('libolm=0.1.0')
source=("$_pkgname::git+https://matrix.org/git/olm")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

#check() {
#  cd "$srcdir/$_pkgname"
#  make test
#}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sts=2 sw=2 et:
